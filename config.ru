require_relative 'config/environment'

#if ActiveRecord::Migrator.needs_migration?
#original if statment (above) was rasing the following error in broswer:
#NoMethodError: undefined method `needs_migration?' for ActiveRecord::Migrator:Class

if ActiveRecord::Base.connection.migration_context.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
use BooksController
use UsersController
use ReviewsController
run ApplicationController
