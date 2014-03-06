require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/rvm'

set :user, 'deploy'
set :domain, 'staging.pixelate.net'
set :codename, 'threadmuncher'
set :deploy_to, "/home/#{user}/ruby/#{codename}"
set :repository, 'git@github.com:patrickng/threadmuncher.git'
set :branch, 'production-rails-4.0'

set :app_path, "#{deploy_to}/#{current_path}"
set :app_port, '9000'
set :pid_file, "#{deploy_to}/shared/tmp/pids/#{rails_env}.pid"
set :socket, "#{deploy_to}/shared/tmp/sockets/#{rails_env}.sock"
set :state, "#{deploy_to}/shared/tmp/state/#{rails_env}.state"

set :shared_paths, ['config/database.yml', 'log']

task :environment do
  invoke :'rvm:use[ruby-2.0.0-p247@default]'
end

task :setup => :environment do
  queue! %[mkdir -p "#{deploy_to}/shared/log"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/log"]
 
  queue! %[mkdir -p "#{deploy_to}/shared/tmp/pids"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/tmp"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/tmp/pids"]

  queue! %[mkdir -p "#{deploy_to}/shared/tmp/sockets"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/tmp/sockets"]

  queue! %[mkdir -p "#{deploy_to}/shared/tmp/state"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/tmp/state"]
 
  queue! %[mkdir -p "#{deploy_to}/shared/config"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/config"]
 
  queue! %[touch "#{deploy_to}/shared/config/database.yml"]
  queue!  %[echo "-----> Be sure to edit 'shared/config/database.yml'."]
end

desc "Deploys the current version to the server."
task :deploy => :environment do
  deploy do

    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'

    to :launch do
      invoke :restart
    end
  end
end

desc 'Starts the application'
task :start => :environment do
  queue "sudo start puma app=#{app_path}"
end
 
desc 'Stops the application'
task :stop => :environment do
  queue "sudo stop puma app=#{app_path}"
end
 
desc 'Restarts the application'
task :restart => :environment do
  invoke :stop
  invoke :start
end


