curl -sk -u admin -H Content-Type:application/json -X POST -d{"{ "name": "controller1", "deviceDetails": [{ "newDevice": { "address": "1.1.1.1", "userName": "admin", "password": "f5letme1n", "httpsPort": 443, "clusterName": "foo", "useBigiqSync": true, "deployWhenDscChangesPending": false }, "moduleList": [{ "module": "adc_core" }, { "module": "access", "properties": { "cm:access:access-group-name": "newGroup", "cm:access:import-shared": true } } ] } ], "conflictPolicy": "USE_BIGIQ", "versionedConflictPolicy": "USE_BIGIQ", "deviceConflictPolicy": "USE_BIGIP", "snapshotWorkingConfig": false, "defaultStatsConfig": { "enabled": true, "zone": "default" } } https://10.1.1.4/mgmt/cm/global/tasks/device-discovery-import-controller |jq '{Link}'