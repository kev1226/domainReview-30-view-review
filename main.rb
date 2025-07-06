require 'sinatra'
require 'dotenv/load'
require_relative 'config/database'
require_relative 'app/routes'

set :port, ENV['PORT'] || 3080
set :bind, '0.0.0.0'
