# config/puma.rb
port ENV.fetch("PORT") { 4001 }
bind "tcp://0.0.0.0:#{ENV.fetch("PORT") { 4001 }}"
workers ENV.fetch("WEB_CONCURRENCY") { 2 }
threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }.to_i
threads threads_count, threads_count
preload_app!

rackup DefaultRackup
environment ENV.fetch("RAILS_ENV") { "development" }

on_worker_boot do
  # Worker specific setup for Rails.
  ActiveRecord::Base.establish_connection if defined?(ActiveRecord)
end

plugin :tmp_restart
