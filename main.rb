require 'sinatra'
require 'sinatra/reloader' if development?

also_reload 'db/data_access' if development?


get '/' do
  erb :index
end





