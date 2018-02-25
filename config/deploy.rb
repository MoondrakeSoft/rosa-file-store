# config valid for current version and patch releases of Capistrano
lock "~> 3.10.1"

set :application, 'file_store'
set :repo_url, 'git://github.com/MoondrakeSoft/rosa-file-store'

# Default branch is :master
set :branch, ENV['branch'] || 'capistrano'

# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/srv/www/apps/#{fetch :application}"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
set :pty, true

# FIXME: workaround for empty :rails_env when symlinking (bug?)
set :rails_env, 'production' unless fetch(:rails_env)

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []) + %W(
.env.local
.env.#{fetch :rails_env}
config/database.yml
config/secrets.yml
config/puma.rb
)

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []) + %w(
log
tmp/pids
tmp/cache
tmp/sockets
vendor/bundle
)

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
set :keep_releases, 3

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

set :puma_preload_app, true
set :puma_default_control_app, "unix://#{shared_path}/tmp/sockets/pumactl.sock"
set :puma_conf, "#{shared_path}/config/puma.rb"
set :puma_init_active_record, true

set :bundle_flags, ''
