require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base

  configure do
    use Rack::Flash
    register Sinatra::Namespace
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "musicsavedmylife"
  end

  get '/' do
    erb :'home'
  end

  helpers do
    def logged_in?
      !!session[:id]
    end

    def logout
      session.clear
    end
  end

end
