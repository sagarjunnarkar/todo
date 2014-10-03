# config valid only for Capistrano 3.1
lock '3.2.1'

application = 'todo'
set :rvm_ruby_version, '2.1.1'
set :repo_url, 'git@github.com:sagarjunnarkar/todo.git'
set :deploy_to, "/home/ubuntu/#{application}"
set :use_sudo, false
# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app
# set :deploy_to, '/var/www/my_app'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
 set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5
#Rake::Task["deploy:assets:precompile"].clear_actions
desc 'assets_precompile'
namespace :assets do
  task :precompile do
    on roles :app do
      execute "cd #{release_path}/ && RAILS_ENV=production /usr/bin/env rake assets:precompile"
    end
  end
end

task :assets_precompile do
  on roles(:app) do
    execute "cd #{release_path}/ && RAILS_ENV=production ~/.rvm/gems/ruby-2.1.1@global/bin/rake assets:precompile"
    #run "cd #{release_path} && ~/.rvm/gems/ruby-1.9.3-p484@global/bin/rake assets:precompile"
  end
end

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
desc 'hello task'
task :hello do
  on roles(:app) do
    execute "echo 'Hello World' > ~/hello"
  end
end

after 'deploy', 'deploy:compile_assets'
#before 'deploy', 'copy_database_yml'