#### Install zabbix:
```java
# Install zabbix ,come to zabbix folder and use docker-compose setup
cd <Zabbix compose folder>
docker-compose up -d
```

#### Examples of admin tasks:
```java
# Get docker container name
docker ps -a
# Backup of DB Zabbix - configuration data only, no item history/trends
docker exec \
    -ti zabbix_zabbix-db_1 \
    /zabbix-backup/zabbix-mariadb-dump -u zabbix -p zabbix -o /backups

# Full backup of Zabbix DB
docker exec \
    -ti zabbix_zabbix-db_01 \
    bash -c "\
    mysqldump -u zabbix -pzabbix zabbix | \
    bzip2 -cq9 > /backups/zabbix_db_dump_$(date +%Y-%m-%d-%H.%M.%S).sql.bz2"

# Restore Zabbix DB
# remove zabbix server container
cd <Zabbix compose folder> 
docker-compose down
# restore data from dump (all current data will be dropped!!!)
docker exec -i zabbix_zabbix-db_01 sh -c 'bunzip2 -dc /backups/zabbix_db_dump_2016-05-25-02.57.46.sql.bz2 | mysql -uzabbix -p --password=zabbix zabbix'
# run zabbix server again
cd <Zabbix compose folder>
docker-compose up -d
```

#### Environmental variables

Available variables related to XXL features,you can find confiuration file in <Zabbix compose folder>/conf/zabbix:

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| XXL_searcher | true | enable/disable [Zabbix searcher project](https://github.com/monitoringartist/zabbix-searcher) |
| XXL_zapix | false | enable/disable [Zapix project](https://github.com/monitoringartist/zapix) |
| XXL_grapher | false | enable/disable [Grapher project](https://github.com/sepich/zabbixGrapher) |
| XXL_api | true | enable/disable auto import of templates (`.xml`), API curl commands (`.curl`) or API scripts (`.sh`) located in path `/etc/zabbix/api/<custom_folder>` |
| XXL_apiuser | Admin | username used for API commands |
| XXL_apipass | zabbix | password used for API commands |
| XXL_analytics | true | enable/disable collecting of statistics via Google Analytics |

You can use environmental variables to config Zabbix and Zabbix web UI (PHP). Available variables,you can find confiuration file in <Zabbix compose folder>/conf/zabbix:

| Variable | Default value |
| -------- | ------------- |
| PHP_date_timezone | UTC |
| PHP_max_execution_time | 300 |
| PHP_max_input_time | 300 |
| PHP_memory_limit | 128M |
| PHP_error_reporting | E_ALL |
| ZS_ListenPort | 10051 |
| ZS_SourceIP | |
| ZS_LogType | file |
| ZS_LogFile | /tmp/zabbix_server.log |
| ZS_LogFileSize | 10 |
| ZS_DebugLevel | 3 |
| ZS_PidFile | /var/run/zabbix_server.pid |
| ZS_DBHost | zabbix.db |
| ZS_DBName | zabbix |
| ZS_DBSchema | |
| ZS_DBUser | zabbix |
| ZS_DBPassword | zabbix |
| ZS_DBSocket | /tmp/mysql.sock |
| ZS_DBPort | 3306 |
| ZS_StartPollers | 5 |
| ZS_StartPollersUnreachable | 1 |
| ZS_StartTrappers | 5 |
| ZS_StartPingers | 1 |
| ZS_StartDiscoverers | 1 |
| ZS_StartHTTPPollers | 1 |
| ZS_StartIPMIPollers | 0 |
| ZS_StartTimers | 1 |
| ZS_JavaGateway | 127.0.0.1 |
| ZS_JavaGatewayPort | 10052 |
| ZS_StartJavaPollers | 0 |
| ZS_StartVMwareCollectors | 0 |
| ZS_VMwareFrequency | 60 |
| ZS_VMwarePerfFrequency | 60 |
| ZS_VMwareCacheSize | 8M |
| ZS_VMwareTimeout | 10 |
| ZS_SNMPTrapperFile | /tmp/zabbix_traps.tmp |
| ZS_StartSNMPTrapper | 0 |
| ZS_ListenIP | 0.0.0.0 |
| ZS_HousekeepingFrequency | 1 |
| ZS_MaxHousekeeperDelete | 500 |
| ZS_SenderFrequency | 30 |
| ZS_CacheSize | 8M |
| ZS_CacheUpdateFrequency | 60 |
| ZS_StartDBSyncers | 4 |
| ZS_HistoryCacheSize | 8M |
| ZS_TrendCacheSize | 4M |
| ZS_HistoryTextCacheSize | 16M |
| ZS_ValueCacheSize | 8M |
| ZS_Timeout | 3 |
| ZS_TrapperTimeout | 300 |
| ZS_UnreachablePeriod | 45 |
| ZS_UnavailableDelay | 60 |
| ZS_UnreachableDelay | 15 |
| ZS_AlertScriptsPath | /usr/local/share/zabbix/alertscripts |
| ZS_ExternalScripts | /usr/local/share/zabbix/externalscripts |
| ZS_FpingLocation | /usr/sbin/fping |
| ZS_Fping6Location | /usr/sbin/fping6 |
| ZS_SSHKeyLocation | |
| ZS_LogSlowQueries | 0 |
| ZS_TmpDir | /tmp |
| ZS_StartProxyPollers | 1 |
| ZS_ProxyConfigFrequency | 3600 |
| ZS_ProxyDataFrequency | 1 |
| ZS_AllowRoot | 0 |
| ZS_User | zabbix |
| ZS_Include | |
| ZS_SSLCertLocation | /usr/local/share/zabbix/ssl/certs |
| ZS_SSLKeyLocation | /usr/local/share/zabbix/ssl/keys |
| ZS_SSLCALocation | |
| ZS_LoadModulePath | /usr/lib/zabbix/modules |
| ZS_LoadModule | |
| ZS_TLSCAFile | |
| ZS_TLSCRLFile | |
| ZS_TLSCertFile | |
| ZS_TLSKeyFile | |
| ZW_ZBX_SERVER | localhost |
| ZW_ZBX_SERVER_PORT | 10051 |
| ZW_ZBX_SERVER_NAME | Zabbix Server |
| ZJ_LISTEN_IP | 0.0.0.0 |
| ZJ_LISTEN_PORT | 10052 |
| ZJ_PID_FILE | /tmp/zabbix_java.pid |
| ZJ_START_POLLERS | 5 |
| ZJ_TIMEOUT | 3 |
| ZJ_LogLevel | error |
| ZJ_TCP_TIMEOUT | 3000 |
| ZP_LogType | console |
| ZP_DBHost | zabbixproxy.db |
| ZP_DBName | zabbix |
| ZP_DBUser | zabbix |
| ZP_DBPassword | zabbix |
| ZP_DBPort | 3306 |
| ZP_User | zabbix |

Note: Japanese users might want to set env. variable `ZBX_GRAPH_FONT_NAME=ipag` to support japanese font in graphs.


#### HTTPS web interface

Set up nginx - customize [default.conf](https://github.com/monitoringartist/zabbix-xxl/blob/master/Dockerfile/zabbix-3.0/container-files-zabbix/etc/nginx/hosts.d/default.conf)
and then use volume to mount custom nginx configuration (for example `-v /etc/https-zabbix-nginx.conf:/etc/nginx/hosts.d/default.conf`) + mount also certificates used in your custom nginx conf file.


Docker troubleshooting
======================

Use docker command to see if all required containers are up and running:
```
$ docker ps
```

Check logs of Zabbix container:
```
$ docker logs zabbix_zabbix_1
```

Sometimes you might just want to review how things are deployed inside a running
 container, you can do this by executing a _bash shell_ through _docker's
 exec_ command:
```
docker exec -ti zabbix_zabbix_1 /bin/bash
```

History of an image and size of layers:
```
docker history --no-trunc=true monitoringartist/zabbix-3.0-xxl | tr -s ' ' | tail -n+2 | awk -F " ago " '{print $2}'
```