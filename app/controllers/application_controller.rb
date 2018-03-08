require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
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
