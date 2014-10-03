# config valid only for Capistrano 3.1
lock '3.2.1'
set :use_sudo, false

desc 'First Demo Task'
task :first_demo do
  on roles(:app) do
    execute "echo 'First Demo' > ~/first_demo"
  end
end
