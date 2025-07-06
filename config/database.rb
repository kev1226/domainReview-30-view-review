require 'sequel'
require 'dotenv/load'

DB = Sequel.connect(
  adapter: 'postgres',
  host: ENV['POSTGRES_HOST'],
  port: ENV['POSTGRES_PORT'],
  database: ENV['POSTGRES_DB'],
  user: ENV['POSTGRES_USER'],
  password: ENV['POSTGRES_PASSWORD']
)

DB.create_table? :reviews do
  primary_key :id
  String :product_id
  String :email
  String :comment
  Integer :rating
  DateTime :created_at
end
