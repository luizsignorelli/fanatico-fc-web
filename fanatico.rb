#encoding: UTF-8

require 'omniauth/oauth'
require './user'
require './teams'

use Rack::Session::Pool

#Here you have to put your own Application ID and Secret
APP_ID = "179207692146338"
APP_SECRET = "25255a0ea703e0ad339e720f7be797c5"

use OmniAuth::Builder do
  provider :facebook, APP_ID, APP_SECRET, :iframe => true, :scope => 'email, status_update, publish_stream'
end
OmniAuth.config.full_host = 'http://apps.facebook.com/fanatico-fc'

get '/' do
  if !session[:user]
    redirect to("/auth/facebook") and return
  end
  @teams = Teams.all
  @user = User.find(:facebook_id => session[:user][:id]).first
  erb :index
end

post '/' do
  if !session[:user]
    redirect to("/auth/facebook")
  else
    redirect to("/")
  end
end

get '/user/team_feed' do
  @user = User.find(:facebook_id => session[:user][:id]).first
  @user.team_feed
end


post '/choose_team' do
  @user = User.find(:facebook_id => session[:user][:id]).first
  @user.team = params[:team]
  @user.save

  puts params
  erb :index
end

post '/auth/facebook/callback' do
  auth = request.env['omniauth.auth']
  session[:user] = { :id => auth["uid"], :name  => auth["user_info"]["name"], :token =>  auth['credentials']['token']}
  session['fb_error'] = nil
  @user = User.find_or_create_by_facebook_id(session[:user][:id])
  redirect '/'
end

get '/auth/failure' do
  clear_session
  session['fb_error'] = 'In order to use this site you must allow us access to your Facebook data<br />'
  redirect '/'
end

get '/logout' do
  clear_session
  redirect '/'
end

helpers do
  def teams_options
    html = "<select name='team' id='teams' data-placeholder='Qual é o seu time?' style='width:350px;'>"
    html << "<option value=''></option>"
    Teams.all.each_pair do |key,value|
      html << "<option value='#{key}'>#{value[:name]}</option>"
    end

    html << "</select>"
  end
end

def clear_session
  session[:user] = nil
  session['fb_error'] = nil
end
