#!/bin/sh
echo "export MYIP=127.0.0.1"
# xhost +local:
# Step 2. Register Blueprint with Ambari
# https://community.hortonworks.com/questions/38357/enable-kerberos-via-ambari-blueprint.html
echo '
{
  "configurations" : [
    {
      "kerberos-env": {
        "properties_attributes" : { },
        "properties" : {
          "realm" : "AMBARI.APACHE.ORG",
          "kdc_type" : "mit-kdc",
          "kdc_hosts" : "(kerberos_server_name)",
          "admin_server_host" : "(kerberos_server_name)"
        }
      }
    },
    {
      "krb5-conf": {
        "properties_attributes" : { },
        "properties" : {
          "domains" : "AMBARI.APACHE.ORG",
          "manage_krb5_conf" : "true"
        }
      }
    }
  ],
  "host_groups" : [
    {
      "name" : "host_group_1",
      "configurations" : [ ],
      "components" : [
        {
          "name" : "ZOOKEEPER_CLIENT"
        },
        {
          "name" : "ZOOKEEPER_SERVER"
        },
        {
          "name" : "NAMENODE"
        },
        {
          "name" : "HDFS_CLIENT"
        },
        {
          "name" : "DATANODE"
        }
      ],
      "kerberos-env" : [
      {"encryption_types" : ""},
      {"ldap_url" : ""},
      {"container_dn" : ""}],
      "cardinality" : "1"
    },
    {
      "name" : "host_group_2",
      "configurations" : [ ],
      "components" : [
        {
          "name" : "ZOOKEEPER_SERVER"
        },
        {
          "name" : "KERBEROS_CLIENT"
        },
        {
          "name" : "SECONDARY_NAMENODE"
        },
        {
          "name" : "DATANODE"
        }
      ],
      "kerberos-env" : [
      {"encryption_types" : ""},
      {"ldap_url" : ""},
      {"container_dn" : ""}],
      "cardinality" : "1"
    },
    {
      "name" : "host_group_3",
      "configurations" : [ ],
      "components" : [
        {
          "name" : "ZOOKEEPER_CLIENT"
        },
        {
          "name" : "ZOOKEEPER_SERVER"
        },
        {
          "name" : "KERBEROS_CLIENT"
        },
        {
          "name" : "HDFS_CLIENT"
        },
        {
          "name" : "DATANODE"
        }
      ],
      "kerberos-env" : [
      {"encryption_types" : ""},
      {"ldap_url" : ""},
      {"container_dn" : ""}],
      "cardinality" : "1"
    }
  ],
  "Blueprints" : {
    "blueprint_name" : "mydefaults2",
    "stack_name" : "HDP",
    "stack_version" : "2.3",
    "security" : {
         "type" : "KERBEROS"
    }
  }
}
' | curl -H "X-Requested-By: ambari" -X POST -d @- -u admin:admin http://$MYIP:8080/api/v1/blueprints/myBlueprint2
