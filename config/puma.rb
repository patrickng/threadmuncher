user = 'deploy'
codename = 'threadmuncher'
root = "/home/#{user}/ruby/#{codename}"

daemonize true 
# bind "unix://#{root}/shared/tmp/sockets"
# pidfile "#{root}/shared/tmp/pids"
# rackup "#{root}/current/config.ru"
threads 4, 8  
activate_control_app