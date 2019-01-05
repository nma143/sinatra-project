require_relative './config/environment'

require 'sinatra/activerecord/rake'
# This is here (instead of environment file) because you only need to load
# all the rake tasks (rake -T) when you're actually trying to run a rake task
# You don't need to load them all the time


task :console do
  Pry.start
end
