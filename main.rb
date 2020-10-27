require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require 'bcrypt'
require_relative 'db/data_access'

also_reload 'db/data_access' if development?

enable :sessions

def logged_in?
  if session[:user_id]
    true
  else
    false
  end
end

# Can only use if a user is logged in
def current_user
  find_user_by_id(session[:user_id])
end

# Directs to the homepage
get '/' do
  erb :index
end

# Directs to the user registration page
get '/register' do
  erb :register
end

# INSERTS the newly registered user details into the db
post '/register' do
  encrypted_pass = BCrypt::Password.create(params['password'])

  create_user(params['first_name'], params['last_name'], params['email'], encrypted_pass, params['fitness_goal'], params['current_weight'], params['goal_weight'], params['avatar_url'])
  redirect "/"
end

# Directs to user login page
get '/login' do
  erb :login
end

# Creates a user session after a succesfull login 
post '/login' do
  user = find_user_by_email(params['email'])

  if BCrypt::Password.new(user['password_digest']) == (params['password'])
    session[:user_id] = user['id']
    redirect "/"
  else
    erb :login
  end
end

# Log users out of their session
delete '/logout' do
  session[:user_id] = nil
  redirect "/login"
end

# Directs to the user profile page
get '/profile' do
  redirect "/login" unless logged_in?
  user = logged_in_user
  erb :profile, locals: { user: user}
end

get '/profile/:id/edit' do
  user = find_user_by_id(params['id'])
  erb :edit, locals: {user: user}
end

delete '/profile/:id' do
  delete_user(params['id'])
  redirect "/"
end

patch '/profile/:id' do
  update_user(params['first_name'], params['last_name'], params['email'], params['fitness_goal'], params['current_weight'], params['goal_weight'], params['avatar_url'], params['id'])
  redirect "/profile"
end

get '/about' do
  erb :about
end

get '/exercises' do
  redirect '/login' unless logged_in?
  user = logged_in_user
  erb :exercises, locals: { user: user}
end

get '/diet' do
  redirect '/login' unless logged_in?
  user = logged_in_user
  erb :diet, locals: { user: user}
end

get '/privacy' do
  erb :privacy
end

get '/contact' do
  erb :contact
end