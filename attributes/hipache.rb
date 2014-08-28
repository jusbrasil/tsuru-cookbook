
default['hipache']['user'] = 'www-data'
default['hipache']['server']['accessLog'] = '/var/log/hipache/access.log'
default['hipache']['server']['accessLogMode'] = 'file'
default['hipache']['server']['port'] = 80
default['hipache']['server']['workers'] = 5
default['hipache']['server']['maxSockets'] = 300
default['hipache']['server']['deadBackendTTL'] = 30
default['hipache']['server']['tcpTimeout'] = 30
default['hipache']['server']['retryOnError'] = 3
default['hipache']['server']['deadBackendOn500'] = true
default['hipache']['server']['httpKeepAlive'] = false
# default['hipache']['server']['debug'] = false
# default['hipache']['server']['lruCache']['size'] = 5
# default['hipache']['server']['lruCache']['ttl'] = 5
default['hipache']['http']['port'] = 80
default['hipache']['http']['bind'] = ["127.0.0.1", "::1"]
# default['hipache']['https']['port'] = 443
# default['hipache']['https']['bind'] = ["127.0.0.1", "::1"]
# default['hipache']['https']['key'] = nil
# default['hipache']['https']['cert'] = nil
default['hipache']['driver'] = 'redis://127.0.0.1:6379'