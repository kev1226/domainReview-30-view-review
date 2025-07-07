require 'sinatra'
require 'dotenv/load'
require 'sinatra/cross_origin'
require_relative 'config/database'
require_relative 'app/routes'

# Configuración de CORS
configure do
  enable :cross_origin
end

# Headers para permitir solicitudes desde cualquier origen
before do
  response.headers['Access-Control-Allow-Origin'] = '*'
  response.headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, DELETE, OPTIONS'
  response.headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization'
end

# Respuesta a preflight OPTIONS
options '*' do
  200
end

set :port, ENV['PORT'] || 3080
set :bind, '0.0.0.0'
