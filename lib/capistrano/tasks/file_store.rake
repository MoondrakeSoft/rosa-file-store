namespace :file_store do

  desc "Setup config files (first time setup)"
  task :setup do
    on roles(:app) do
      execute "mkdir -p #{shared_path}/config"
      execute "mkdir -p #{shared_path}/tmp/pids"
      %W(.env.local .env.#{fetch :rails_env}).each do |dotenv_rails|
	if File.exists?(dotenv_rails)
	  upload! dotenv_rails, "#{shared_path}/#{dotenv_rails}"
	else
	  execute "touch #{shared_path}/#{dotenv_rails}"
	end
      end

      %w(database secrets).each do |config|
	{
	  "config/#{config}.yml.sample" => "config/#{config}.yml"
	}.each do |src, target|
	  unless test("[ -f #{shared_path}/#{target} ]")
	    upload! src, "#{shared_path}/#{target}"
	  end
	end
      end

      invoke 'puma:config'
    end
  end

end
