user = 'deploy'
codename = 'threadmuncher'
root = "/home/#{user}/ruby/#{codename}"
daemonize true 
bind "unix://#{root}/shared/tmp/sockets/production.sock"
pidfile "#{root}/shared/tmp/pids/production.pid"
state_path "#{root}/shared/tmp/state/production.state"
rackup "#{root}/current/config.ru"
threads 4, 8  
activate_control_app "unix://#{root}/shared/tmp/sockets/production.sock"