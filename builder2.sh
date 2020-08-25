#!/bin/bash
MY_COMMAND+='curl -sk -u admin -H Content-Type:application/json -X POST -d{"'
MY_COMMAND+='{
    "name": "controller1",
    "deviceDetails": [{
                    "newDevice": {
                            "address": "'
MY_COMMAND+=$1
MY_COMMAND+='",
                            "userName": "'
MY_COMMAND+=$2
MY_COMMAND+='",
                            "password": "'
MY_COMMAND+=$3
MY_COMMAND+='",
                            "httpsPort": 443,
                            "clusterName": "foo",
                            "useBigiqSync": true,
                            "deployWhenDscChangesPending": false
                    },
                    "moduleList": [{
                                    "module": "adc_core"
                            },
                            {
                                    "module": "access",
                                    "properties": {
                                            "cm:access:access-group-name": "newGroup",
                                            "cm:access:import-shared": true
                                    }
                            }
                    ]
            }
    ],
    "conflictPolicy": "USE_BIGIQ",
    "versionedConflictPolicy": "USE_BIGIQ",
    "deviceConflictPolicy": "USE_BIGIP",
    "snapshotWorkingConfig": false,
    "defaultStatsConfig": {
            "enabled": true,
            "zone": "default"
    }
"}'
#MY_COMMAND+=$1
#MY_COMMAND+=" "
#MY_COMMAND+=$2
#MY_COMMAND+=" "
#MY_COMMAND+=$3
#MY_COMMAND+='"'
#MY_COMMAND+="}"
MY_COMMAND+="  https://10.1.1.4/mgmt/cm/global/tasks/device-discovery-import-controller |jq '{Link}'"


# curl -sk -u admin -H Content-Type:application/json -X POST -d{"address":"$listaddress"}  https://10.1.1.4/mgmt/cm/shared/device-reference-query;done|jq '{Link}'


#echo "Hi, you told me about these:"
#echo $1 $2 $3 
#echo "Assembled, the command looks like this:"

echo $MY_COMMAND
