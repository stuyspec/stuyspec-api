# config valid for current version and patch releases of Capistrano
lock "~> 3.12.0"

set :rvm_type, :user
set :rvm_ruby_version, '2.7.0'

set :application, "stuyspec-api"
set :repo_url, "https://github.com/stuyspec/stuyspec-api.git"
#set :migration_role, :app
set :deploy_to, "/home/ubuntu/deploy"
set :branch, "master"

task :build_client_app do
  run_locally do
    execute "if cd stuyspec.com; then git reset --hard HEAD && git pull; else git clone https://github.com/stuyspec/stuyspec.com.git; cd stuyspec.com; fi"
    execute "cd stuyspec.com; npm install"
    execute "cd stuyspec.com; npm run build"
    execute "cd stuyspec.com; rm -rf client-app; cp -a build/ client-app/"
  end
end

task :build_cms do
  run_locally do
    execute "if cd cms; then git reset --hard HEAD && git pull; else git clone https://github.com/stuyspec/cms.git; cd cms; fi"
    execute "cd cms; npm install"
    execute "cd cms; npm run build"
    execute "cd cms; rm -rf cms; cp -a build/ cms/"
  end
end

task :upload_apps do
  on roles(:app) do
    upload! "./stuyspec.com/client-app", release_path + "public", recursive: true
    upload! "./cms/cms", release_path + "public", recursive: true
  end
end

before "deploy:starting", "build_client_app"
before "deploy:starting", "build_cms"

before "deploy:publishing", "upload_apps"
