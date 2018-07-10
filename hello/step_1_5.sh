#!/bin/sh
echo "export MYIP=127.0.0.1"
# Step 5. Create cluster with Ambari
echo '
{
  "blueprint" : "blueprint-name",
  "default_password" : "super-secret-password",
  "provision_action" : "(INSTALL_AND_START | INSTALL_ONLY)"
  "configurations" : [
    {
      "configuration-type" : {
        "property-name" : "property-value"
      }
    }
    ...
  ],    
  "host_groups" :[
    {
      "name" : "host-group-name", 
      "configurations" : [
        {
          "configuration-type" : {
            "property-name" : "property-value"
          }
        }
      ],    
      "hosts" : [         
        {
          "fqdn" : "host.domain.com"
        },
        {
          "fqdn" : "host2.domain.com"
        }
        ...
      ]
    }
    ...
  ],
  "credentials" : [
      {
        "alias" : "kdc.admin.credential",
        "principal" : "{PRINCIPAL}",
        "key" : "{KEY}",
        "type" : "(TEMPORARY | PERSISTED)"
      }
  ],
  "security" : {
         "type" : "(NONE | KERBEROS)",
         "kerberos_descriptor" : {
             ...
          }
  }
}
' | curl -H "X-Requested-By: ambari" -X POST -u admin:admin http://$MYIP:8080/api/v1/clusters/myCluster
