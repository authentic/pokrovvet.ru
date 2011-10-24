require 'bundler/capistrano'



#############################################################
#	Application
#############################################################
set :application, "pokrovvet.ru"
set :deploy_to, "/home/townofma/#{application}"

#############################################################
#	Settings
#############################################################

default_run_options[:pty] = true
set :use_sudo, false
ssh_options[:port] = 7822
ssh_options[:keys] = %w(~/.ssh/id_dsa)
set :scm_verbose, true

#############################################################
#	Servers
#############################################################

set :user, "townofma"
set :domain, "townofma.www65.a2hosting.com"
role :web, domain
role :app, domain
role :db, domain, :primary => true

#############################################################
#	Git
#############################################################
set :repository, "git@github.com:authentic/pokrovvet.ru.git"
set :scm, "git"
set :branch, "master"
set :deploy_via, :remote_cache

#############################################################
#	Passenger
#############################################################

 namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
   run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
 end