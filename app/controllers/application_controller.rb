require './config/environment'
require 'sinatra/flash'

class ApplicationController < Sinatra::Base

  configure do
    register Sinatra::Flash
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

    def errors_found(obj_name)
      error_msg = obj_name.errors.messages.map do |key, val|
        val.map { |arg| "#{key} #{arg}"}
      end.join(', ') + '.'
    end
  end

end
