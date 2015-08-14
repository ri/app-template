require 'sinatra'
require 'sass'
require 'coffee-script'

configure :development do
  require 'rack/reloader'
  Sinatra::Application.reset!
  use Rack::Reloader
end

get '/:name.js' do
  coffee :"#{params[:name]}"
end

get '/screen.css' do
  scss :"stylesheets/screen"
end

get '/' do
  erb :index, :layout => :layout
end

get '/:name' do
  erb :"/#{params[:name].to_sym}"
end