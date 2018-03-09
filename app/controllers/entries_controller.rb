class EntriesController < ApplicationController
  get '/entries/new' do
    if logged_in?
      erb :'entries/new_entry'
    else
      redirect '/login'
    end
  end
end
