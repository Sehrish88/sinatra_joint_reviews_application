require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end
#in order to get patch and DELETE requests, i will need to add a line of code here
use Rack::MethodOverride 
#here is where I will mount other controllers with use

use UsersController
use ReviewPostsController 
run ApplicationController
