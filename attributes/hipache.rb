default['hipache']['user'] = 'www-data'
default['hipache']['server']['accessLog'] = '/var/log/hipache/access.log'
default['hipache']['server']['port'] = 80
default['hipache']['server']['workers'] = 5
default['hipache']['server']['maxSockets'] = 300
default['hipache']['server']['deadBackendTTL'] = 30
default['hipache']['server']['address'] = ["0.0.0.0"]
default['hipache']['server']['address6'] = [ "::1"]
# default['hipache']['server']['https']['port'] = 443
# default['hipache']['server']['https']['key'] = "/etc/ssl/ssl.key"
# default['hipache']['server']['https']['cert'] = "/etc/ssl/ssl.crt"
default['hipache']['redisHost'] = '127.0.0.1'
default['hipache']['redisPort'] = '6379'
default['hipache']['redisDatabase'] = '0'
# default['hipache']['redisPassword'] = 'password'
