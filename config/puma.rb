user = 'deploy'
codename = 'threadmuncher'
root = "/home/#{user}/ruby/#{codename}"
environment 'production'
daemonize true 
bind "unix://#{root}/shared/tmp/sockets/#{environment}.sock"
pidfile "#{root}/shared/tmp/pids/#{environment}.pid"
rackup "#{root}/current/config.ru"
threads 4, 8  
activate_control_app "unix://#{root}/shared/tmp/sockets/#{environment}.sock"