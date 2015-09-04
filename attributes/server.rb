default['tsuru']['cname'] = node['fqdn']

## HTTP server
default['tsuru']['server']['listen'] = '0.0.0.0:8080'
# default['tsuru']['server']['use-tls'] = false
# default['tsuru']['server']['tls']['cert-file'] = nil # path to cert
# default['tsuru']['server']['tls']['key-file'] = nil # path to key
default['tsuru']['server']['host'] = "http#{'s' if node['tsuru']['server']['use-tls']}://#{node['tsuru']['cname']}:#{node['tsuru']['server']['listen'][/\d+$/]}"
# default['tsuru']['server']['server']['read-timeout'] = 0
# default['tsuru']['server']['server']:['write-timeout'] = 0
# default['tsuru']['server']['disable-index-page'] = false
# default['tsuru']['server']['index-page-template']

## Database acess
default['tsuru']['server']['database']['url'] = '127.0.0.1:27017'
default['tsuru']['server']['database']['name'] = 'tsuru'
# default['tsuru']['server']['database']['logdb-url'] = nil
# default['tsuru']['server']['database']['logdb-name'] = nil

## Email configuration
# default['tsuru']['server']['smtp']['server'] = nil
# default['tsuru']['server']['smtp']['user'] = nil
# default['tsuru']['server']['smtp']['password'] = nil

## Repository configuration
# default['tsuru']['server']['repo-manager'] = "gandalf"
default['tsuru']['server']['git']['api-server'] = "http://#{node['gandalf-server']['host']}:8000"

## Authentication configuration
default['tsuru']['server']['auth']['scheme'] = 'native' #only other option is oauth
default['tsuru']['server']['auth']['user-registration'] = false
default['tsuru']['server']['auth']['hash-cost'] = 10
# default['tsuru']['server']['auth']['token-expire-days'] = 7
# default['tsuru']['server']['auth']['max-simultaneous-sessions'] = 'unlimited'
## the below oauth options must all be set if auth:scheme = oauth
# default['tsuru']['server']['auth']['oauth']['client-id'] = nil
# default['tsuru']['server']['auth']['oauth']['client-secret'] = nil
# default['tsuru']['server']['auth']['oauth']['scope'] = nil
# default['tsuru']['server']['auth']['oauth']['auth-url'] = nil
# default['tsuru']['server']['auth']['oauth']['token-url'] = nil
# default['tsuru']['server']['auth']['oauth']['info-url'] = nil
# default['tsuru']['server']['auth']['oauth']['collection'] = 'oauth_tokens'
# default['tsuru']['server']['auth']['oauth']['callback-port'] = nil

## Queue configuration
default['tsuru']['server']['queue']['mongo-url'] = '127.0.0.1:27017'
default['tsuru']['server']['queue']['mongo-database'] = 'redis'
default['tsuru']['server']['pubsub']['redis-host'] = '127.0.0.1'
default['tsuru']['server']['pubsub']['redis-port'] = 'queuedb'
# default['tsuru']['server']['pubsub']['redis-password'] = nil
# default['tsuru']['server']['pubsub']['redis-db'] = nil
# default['tsuru']['server']['pubsub']['pool-max-idle-conn'] = nil
# default['tsuru']['server']['pubsub']['pool-idle-timeout'] = nil
# default['tsuru']['server']['pubsub']['redis-dial-timeout'] = nil
# default['tsuru']['server']['pubsub']['redis-read-timeout'] = nil
# default['tsuru']['server']['pubsub']['redis-write-timeout'] = nil

## Admin users
default['tsuru']['server']['admin-team'] = 'admin'

## Quota management
# default['tsuru']['server']['quota']['units-per-app'] = 'unlimited'
# default['tsuru']['server']['quota']['apps-per-user'] = 'unlimited'

## Logging
default['tsuru']['server']['debug'] = false
## when log:file is unset, tsuru logs to syslog
#default['tsuru']['server']['log']['file'] = '/var/log/tsuru.log'
#default['tsuru']['server']['log']['disable-syslog'] = false
#default['tsuru']['server']['log']['syslog-tag'] = 'tsr'
#default['tsuru']['server']['log']['use-stderr'] = false

## Routers - http://docs.tsuru.io/en/stable/reference/config.html#routers
## using hipache as default
default['tsuru']['server']['routers']['hipache']['type'] = 'hipache'
default['tsuru']['server']['routers']['hipache']['domain'] = node['tsuru']['server']['cname']
default['tsuru']['server']['routers']['hipache']['redis-server'] = '127.0.0.1:6379'

## Provisioner
default['tsuru']['server']['provisioner'] = 'docker'

## Docker provisioner
default['tsuru']['server']['docker']['collection'] = 'docker_containers'
# default['tsuru']['server']['docker']['port-allocator'] = 'docker'
# default['tsuru']['server']['docker']['registry'] = "#{node.fqdn}:5000"
# default['tsuru']['server']['docker']['registry']['registry-max-try'] = nil
# default['tsuru']['server']['docker']['registry-auth']['username'] = nil
# default['tsuru']['server']['docker']['registry-auth']['password'] = nil
# default['tsuru']['server']['docker']['registry-auth']['email'] = nil
default['tsuru']['server']['docker']['repository-namespace'] = 'tsuru'
# default['tsuru']['server']['docker']['bs']['image'] = 'tsuru/bs:v1'
default['tsuru']['server']['docker']['bs']['socket'] = '/var/run/docker.sock'
# default['tsuru']['server']['docker']['bs']['syslog-port'] = 1514
# default['tsuru']['server']['docker']['max-workers'] = 0
default['tsuru']['server']['docker']['router'] = 'hipache'
default['tsuru']['server']['docker']['deploy-cmd'] = '/var/lib/tsuru/deploy'
# default['tsuru']['server']['docker']['security-opts'] = nil # http://docs.tsuru.io/en/stable/reference/config.html#docker-security-opts
# default['tsuru']['server']['docker']['scheduler']['total-memory-metadata'] = nil
# default['tsuru']['server']['docker']['scheduler']['max-used-memory'] = nil
default['tsuru']['server']['docker']['cluster']['storage'] = 'mongodb'
default['tsuru']['server']['docker']['cluster']['mongo-url'] = '127.0.0.1:27017'
default['tsuru']['server']['docker']['cluster']['mongo-database'] = 'cluster'
default['tsuru']['server']['docker']['run-cmd']['bin'] = '/var/lib/tsuru/start'
default['tsuru']['server']['docker']['run-cmd']['port'] = '8888'
default['tsuru']['server']['docker']['ssh']['user'] = 'ubuntu'
#default['tsuru']['server']['docker']['healing']['heal-nodes'] = false
#default['tsuru']['server']['docker']['healing']['active-monitoring-interval'] = 0
#default['tsuru']['server']['docker']['healing']['disabled-time'] = 30
#default['tsuru']['server']['docker']['healing']['max-failures'] = 5
#default['tsuru']['server']['docker']['healing']['wait-new-time'] = 300
#default['tsuru']['server']['docker']['healing']['heal-containers-timeout'] = 0
#default['tsuru']['server']['docker']['healing']['events_collection'] = 'healing_events'
#default['tsuru']['server']['docker']['healthcheck']['max-time'] = 120
#default['tsuru']['server']['docker']['image-history-size'] = 10
#default['tsuru']['server']['docker']['auto-scale']['enabled'] = false
#default['tsuru']['server']['docker']['auto-scale']['wait-new-time'] = 300
#default['tsuru']['server']['docker']['auto-scale']['group-by-metadata'] = nil
#default['tsuru']['server']['docker']['auto-scale']['metadata-filter'] = nil
#default['tsuru']['server']['docker']['auto-scale']['max-container-count'] = nil
#default['tsuru']['server']['docker']['auto-scale']['prevent-rebalance'] = nil
#default['tsuru']['server']['docker']['auto-scale']['run-interval'] = 3600
#default['tsuru']['server']['docker']['auto-scale']['scale-down-ratio'] = 1.33

## IaaS configuration - http://docs.tsuru.io/en/stable/reference/config.html#iaas-configuration
