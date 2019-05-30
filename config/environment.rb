require 'bundler'
# require 'csv'
Bundler.require
require 'tty-prompt'
require_all 'lib'
# require 'faker'


ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')

ActiveRecord::Base.logger = nil
