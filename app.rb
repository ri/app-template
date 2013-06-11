require 'sinatra'
require 'sass'

configure :development do
  require 'rack/reloader'
  Sinatra::Application.reset!
  use Rack::Reloader

  require 'better_errors'
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path("..", __FILE__)
end

get '/screen.css' do
  scss :"stylesheets/screen"
end

get '/' do
  erb :index, :layout => :layout
end