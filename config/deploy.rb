# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

set :rvm_type, :user
set :rvm_ruby_version, '2.4.2'

set :application, "stuyspec-api"
set :repo_url, "https://github.com/stuyspec/stuyspec-api.git"
#set :migration_role, :app
set :deploy_to, "/home/ubuntu/deploy"
set :branch, "master"

task :clone_client_app do
  on roles(:app) do
    within release_path do
      execute "rm", "-rf stuyspec.com"
      execute "git", "clone https://github.com/stuyspec/stuyspec.com.git"
    end
  end
end

task :build_client_app do
  on roles(:app) do
    within release_path do
      within "./public" do
        execute "mkdir", "client-app"
      end
      within "./stuyspec.com" do
        execute "git", "checkout master"
        execute "npm", "install"
        execute "npm", "run build"
        execute "mv", "./build/* ../public/client-app/"
      end
    end
  end
end

task :upload_client_app do
  run_locally do
    execute "if cd stuyspec.com; then git pull; else git clone https://github.com/stuyspec/stuyspec.com.git; cd stuyspec.com; fi"
    execute "cd stuyspec.com; npm install"
    execute "cd stuyspec.com; npm run build"
    execute "cd stuyspec.com; rm -rf client-app; cp -a build/ client-app/"
    execute "cd stuyspec.com; ls -a"
  end
  on roles(:app) do
    upload! "./stuyspec.com/client-app", release_path + "public", recursive: true
  end
end

# after "deploy:updated", "clone_client_app"
# after "deploy:updated", "build_client_app"

after "deploy:published", "upload_client_app"
