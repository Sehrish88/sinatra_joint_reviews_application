ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

#Establishes the connection to the database. Accepts a hash as input where the :adapter key must be specified with the name of a database adapter
ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)



require './app/controllers/application_controller'
require_all 'app'
