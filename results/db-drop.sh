#!/bin/sh

mysql --host=localhost --user=root --password=$MYSQL_ROOT_PASSWORD -e 'drop table host_overload; drop table host_resource_usage; drop table host_states; drop table hosts; drop table vm_migrations; drop table vm_resource_usage; drop table vms;' spe
