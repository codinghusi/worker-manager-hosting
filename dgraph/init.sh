#!/bin/sh

check_file=/dgraph/initialized.txt

while [ ! -d "$check_file" ];
do
    sleep 30s
    if curl -X POST 'http://localhost:8080/admin/schema' --data-binary '@schema.graphql' | grep 'Success'
    then
        echo "\n------------------ initialized graphql schema ------"
        echo "finished" > $check_file
        break
    fi

    break # somehow checking for 'Success' doesn't work anymore
done