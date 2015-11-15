# -*- encoding : utf-8 -*-
#base_path = File.expand_path(File.join File.dirname(__FILE__), '..')
base_path  = "/app/file_store"

rails_env = ENV['RAILS_ENV'] || 'production'

worker_processes ENV['WORKER_PROCESSES'] || 7
working_directory File.join(base_path) # available in 0.94.0+

# listen File.join(base_path, 'tmp', 'unicorn.sock')
# listen "/tmp/.sock", :backlog => 64
# listen 8080, :tcp_nopush => true

# nuke workers after 30 seconds instead of 60 seconds (the default)
timeout 600

# REE or Ruby 2.0
# http://www.rubyenterpriseedition.com/faq.html#adapt_apps_for_cow
GC.copy_on_write_friendly = true if GC.respond_to?(:copy_on_write_friendly=)

before_exec do |server|
  ENV["BUNDLE_GEMFILE"] = "#{base_path}/Gemfile"
end

# By default, the Unicorn logger will write to stderr.
# Additionally, ome applications/frameworks log to stderr or stdout,
# so prevent them from going to /dev/null when daemonized here:
stderr_path File.join(base_path, 'log', 'unicorn.stderr.log')
stdout_path File.join(base_path, 'log', 'unicorn.stdout.log')


# combine REE with "preload_app true" for memory savings
# http://rubyenterpriseedition.com/faq.html#adapt_apps_for_cow
preload_app true

after_fork do |server, worker|
  # Here we are establishing the connection after forking worker processes
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection

  # if preload_app is true, then you may also want to check and
  # restart any other shared sockets/descriptors such as Memcached,
  # and Redis.  TokyoCabinet file handles are safe to reuse
  # between any number of forked children (assuming your kernel
  # correctly implements pread()/pwrite() system calls)
  # srand
end
