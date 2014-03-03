require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/rvm'

# Basic settings:
#   domain       - The hostname to SSH to.
#   deploy_to    - Path to deploy into.
#   repository   - Git repo to clone from. (needed by mina/git)
#   branch       - Branch name to deploy. (needed by mina/git)

set :domain, 'staging.pixelate.net'
set :deploy_to, '/home/deploy/ruby/threadmuncher'
set :repository, 'git@github.com:patrickng/threadmuncher.git'
set :branch, 'master'
set :user, 'deploy'

set :shared_paths, ['config/database.yml', 'log']
set :app_path, "#{deploy_to}/#{current_path}"

task :environment do
  invoke :'rvm:use[ruby-2.0.0-p247@default]'
end

task :setup => :environment do
  queue! %[mkdir -p "#{deploy_to}/shared/log"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/log"]

  queue! %[mkdir -p "#{deploy_to}/shared/config"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/config"]

  queue! %[touch "#{deploy_to}/shared/config/database.yml"]
  queue  %[echo "-----> Be sure to edit 'shared/config/database.yml'."]
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
      # invoke :restart
    end
  end
end

desc 'Starts the application'
task :start => :environment do
  queue "cd #{app_path} ; bundle exec rackup -s puma " +
    "-p #{app_port} -P #{pid_file} -E #{rails_env} -D"
  queue "cd #{app_path} ; RAILS_ENV=#{rails_env} ./script/delayed_job start"
end
 
desc 'Stops the application'
task :stop => :environment do
  queue "cd #{app_path} ; RAILS_ENV=#{rails_env} ./script/delayed_job stop"
  queue %[kill -9 `cat #{pid_file}`]
end
 
desc 'Restarts the application'
task :restart => :environment do
  invoke :stop
  invoke :start
end


