# Copyright 2012 Anton Beloglazov
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

from contracts import contract
import datetime
from sqlalchemy import *
from sqlalchemy.engine.base import Connection


class Database(object):
    """ A class representing the database, where fields are tables.
    """

    @contract(connection=Connection,
              hosts=Table,
              host_resource_usage=Table,
              vms=Table,
              vm_resource_usage=Table,
              vm_migrations=Table,
              host_states=Table,
              host_overload=Table)
    def __init__(self, connection, hosts, host_resource_usage, vms, 
                 vm_resource_usage, vm_migrations, host_states, host_overload):
        """ Initialize the database.

        :param connection: A database connection table.
        :param hosts: The hosts table.
        :param host_resource_usage: The host_resource_usage table.
        :param vms: The vms table.
        :param vm_resource_usage: The vm_resource_usage table.
        :param vm_migrations: The vm_migrations table.
        :param host_states: The host_states table.
        :param host_overload: The host_overload table.
        """
        self.connection = connection
        self.hosts = hosts
        self.host_resource_usage = host_resource_usage
        self.vms = vms
        self.vm_resource_usage = vm_resource_usage
        self.vm_migrations = vm_migrations
        self.host_states = host_states
        self.host_overload = host_overload

    @contract
    def select_cpu_mhz_for_vm(self, uuid, n):
        """ Select n last values of CPU MHz for a VM UUID.

        :param uuid: The UUID of a VM.
         :type uuid: str[36]

        :param n: The number of last values to select.
         :type n: int,>0

        :return: The list of n last CPU Mhz values.
         :rtype: list(int)
        """
        sel = select([self.vm_resource_usage.c.cpu_mhz]). \
            where(and_(
                self.vms.c.id == self.vm_resource_usage.c.vm_id,
                self.vms.c.uuid == uuid)). \
            order_by(self.vm_resource_usage.c.id.desc()). \
            limit(n)
        res = self.connection.execute(sel).fetchall()
        return list(reversed([int(x[0]) for x in res]))

    @contract
    def select_last_cpu_mhz_for_vms(self):
        """ Select the last value of CPU MHz for all the VMs.

        :return: A dict of VM UUIDs to the last CPU MHz values.
         :rtype: dict(str: int)
        """
        vru1 = self.vm_resource_usage
        vru2 = self.vm_resource_usage.alias()
        sel = select([vru1.c.vm_id, vru1.c.cpu_mhz], from_obj=[
            vru1.outerjoin(vru2, and_(
                vru1.c.vm_id == vru2.c.vm_id,
                vru1.c.id < vru2.c.id))]). \
             where(vru2.c.id == None)
        vms_cpu_mhz = dict(self.connection.execute(sel).fetchall())
        vms_uuids = dict(self.vms.select().execute().fetchall())

        vms_last_mhz = {}
        for id, uuid in vms_uuids.items():
            if id in vms_cpu_mhz:
                vms_last_mhz[str(uuid)] = int(vms_cpu_mhz[id])
            else:
                vms_last_mhz[str(uuid)] = 0
        return vms_last_mhz

    @contract
    def select_vm_id(self, uuid):
        """ Select the ID of a VM by the VM UUID, or insert a new record.

        :param uuid: The UUID of a VM.
         :type uuid: str[36]

        :return: The ID of the VM.
         :rtype: number
        """
        sel = select([self.vms.c.id]).where(self.vms.c.uuid == uuid)
        row = self.connection.execute(sel).fetchone()
        if row is None:
            id = self.vms.insert().execute(uuid=uuid).inserted_primary_key[0]
            return id
        else:
            return row['id']

    @contract
    def select_cpu_mhz_for_host(self, hostname, n):
        """ Select n last values of CPU MHz for a host.

        :param hostname: A host name.
         :type hostname: str

        :param n: The number of last values to select.
         :type n: int,>0

        :return: The list of n last CPU Mhz values.
         :rtype: list(int)
        """
        sel = select([self.host_resource_usage.c.cpu_mhz]). \
            where(and_(
                self.hosts.c.id == self.host_resource_usage.c.host_id,
                self.hosts.c.hostname == hostname)). \
            order_by(self.host_resource_usage.c.id.desc()). \
            limit(n)
        res = self.connection.execute(sel).fetchall()
        return list(reversed([int(x[0]) for x in res]))

    @contract
    def select_last_cpu_mhz_for_hosts(self):
        """ Select the last value of CPU MHz for all the hosts.

        :return: A dict of host names to the last CPU MHz values.
         :rtype: dict(str: int)
        """
        hru1 = self.host_resource_usage
        hru2 = self.host_resource_usage.alias()
        sel = select([hru1.c.host_id, hru1.c.cpu_mhz], from_obj=[
            hru1.outerjoin(hru2, and_(
                hru1.c.host_id == hru2.c.host_id,
                hru1.c.id < hru2.c.id))]). \
             where(hru2.c.id == None)
        hosts_cpu_mhz = dict(self.connection.execute(sel).fetchall())

        sel = select([self.hosts.c.id, self.hosts.c.hostname])
        hosts_names = dict(self.connection.execute(sel).fetchall())

        hosts_last_mhz = {}
        for id, hostname in hosts_names.items():
            if id in hosts_cpu_mhz:
                hosts_last_mhz[str(hostname)] = int(hosts_cpu_mhz[id])
            else:
                hosts_last_mhz[str(hostname)] = 0
        return hosts_last_mhz

    @contract
    def select_host_characteristics(self):
        """ Select the characteristics of all the hosts.

        :return: Three dicts of hostnames to CPU MHz, cores, and RAM.
         :rtype: tuple(dict(str: int), dict(str: int), dict(str: int))
        """
        hosts_cpu_mhz = {}
        hosts_cpu_cores = {}
        hosts_ram = {}
        for x in self.hosts.select().execute().fetchall():
            hostname = str(x[1])
            hosts_cpu_mhz[hostname] = int(x[2])
            hosts_cpu_cores[hostname] = int(x[3])
            hosts_ram[hostname] = int(x[4])
        return hosts_cpu_mhz, hosts_cpu_cores, hosts_ram

    @contract
    def select_host_id(self, hostname):
        """ Select the ID of a host.

        :param hostname: A host name.
         :type hostname: str

        :return: The ID of the host.
         :rtype: int
        """
        sel = select([self.hosts.c.id]). \
            where(self.hosts.c.hostname == hostname)
        row = self.connection.execute(sel).fetchone()
        if not row:
            raise LookupError('No host found for hostname: %s', hostname)
        return int(row['id'])

    @contract
    def select_host_ids(self):
        """ Select the IDs of all the hosts.

        :return: A dict of host names to IDs.
         :rtype: dict(str: int)
        """
        return dict((str(x[1]), int(x[0])) 
                    for x in self.hosts.select().execute().fetchall())

    @contract
    def select_host_states(self, host_id, start_time):
        """ Select the states of a host.

        :param start_time: The start time to select host states.
         :type start_time: *

        :return: A dict of host names to states.
         :rtype: list(tuple(*, int))
        """
        hs = self.host_states
        sel = select([hs.c.timestamp, hs.c.state]). \
            where(and_(hs.c.host_id == host_id,
                       hs.c.timestamp >= start_time)). \
            order_by(hs.c.id.asc())
        return [(x[0], int(x[1])) 
                for x in self.connection.execute(sel).fetchall()]

    @contract
    def select_active_hosts(self):
        """ Select the currently active hosts.

        :return: A list of host names.
         :rtype: list(str)
        """
        return [host 
                for host, state in self.select_host_states().items() 
                if state == 1]

    @contract
    def select_inactive_hosts(self):
        """ Select the currently inactive hosts.

        :return: A list of host names.
         :rtype: list(str)
        """
        return [host 
                for host, state in self.select_host_states().items() 
                if state == 0]

    @contract
    def insert_vm_migration(self, vm, hostname):
        """ Insert a VM migration.

        :param hostname: A VM UUID.
         :type hostname: str[36]

        :param hostname: A host name.
         :type hostname: str
        """
        self.vm_migrations.insert().execute(
            vm_id=self.select_vm_id(vm),
            host_id=self.select_host_id(hostname))
        

@contract
def init_db(sql_connection):
    """ Initialize the database.

    :param sql_connection: A database connection URL.
     :type sql_connection: str

    :return: The initialized database.
     :rtype: *
    """
    engine = create_engine(sql_connection)  # 'sqlite:///:memory:'
    metadata = MetaData()
    metadata.bind = engine

    hosts = Table('hosts', metadata,
                  Column('id', Integer, primary_key=True),
                  Column('hostname', String(255), nullable=False),
                  Column('cpu_mhz', Integer, nullable=False),
                  Column('cpu_cores', Integer, nullable=False),
                  Column('ram', Integer, nullable=False))

    host_resource_usage = \
        Table('host_resource_usage', metadata,
              Column('id', Integer, primary_key=True),
              Column('host_id', Integer, ForeignKey('hosts.id'), nullable=False),
              Column('timestamp', DateTime, default=func.now()),
              Column('cpu_mhz', Integer, nullable=False))

    vms = Table('vms', metadata,
                Column('id', Integer, primary_key=True),
                Column('uuid', String(36), nullable=False))

    vm_resource_usage = \
        Table('vm_resource_usage', metadata,
              Column('id', Integer, primary_key=True),
              Column('vm_id', Integer, ForeignKey('vms.id'), nullable=False),
              Column('timestamp', DateTime, default=func.now()),
              Column('cpu_mhz', Integer, nullable=False))

    vm_migrations = \
        Table('vm_migrations', metadata,
              Column('id', Integer, primary_key=True),
              Column('vm_id', Integer, ForeignKey('vms.id'), nullable=False),
              Column('host_id', Integer, ForeignKey('hosts.id'), nullable=False),
              Column('timestamp', DateTime, default=func.now()))

    host_states = \
        Table('host_states', metadata,
              Column('id', Integer, primary_key=True),
              Column('host_id', Integer, ForeignKey('hosts.id'), nullable=False),
              Column('timestamp', DateTime, default=func.now()),
              Column('state', Integer, nullable=False))

    host_overload = \
        Table('host_overload', metadata,
              Column('id', Integer, primary_key=True),
              Column('host_id', Integer, ForeignKey('hosts.id'), nullable=False),
              Column('timestamp', DateTime, default=func.now()),
              Column('overload', Integer, nullable=False))

    metadata.create_all()
    connection = engine.connect()
    db = Database(connection, hosts, host_resource_usage, vms, 
                  vm_resource_usage, vm_migrations, host_states, host_overload)

    return db
