require_relative 'controllers/reviews_controller'
require_relative 'utils/jwt_helper'

before do
  pass if request.path_info == '/'
  header = request.env['HTTP_AUTHORIZATION']
  halt 401, { error: 'Token requerido' }.to_json if header.nil?

  token = header.split(' ').last
  begin
    @current_user = JWTHelper.decode_token(token)
  rescue => e
    halt 403, { error: e.message }.to_json
  end
end

get '/' do
  { message: 'Get Review service running' }.to_json
end

get '/reviews/:product_id' do
  ReviewsController.new.list(params, request)
end
