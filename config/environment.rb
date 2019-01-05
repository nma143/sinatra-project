require 'bundler'

Bundler.require #load all the rubygems

#now that the gems are loaded, set up db connction

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/development.sqlite"
)

#also require everything in the app folder
require_all 'app'
