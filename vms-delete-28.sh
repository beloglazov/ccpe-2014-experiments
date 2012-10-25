#!/bin/sh

for i in {1..28}
do
    nova delete "ubuntu$i"
done
