class EntriesController < ApplicationController
  get '/entries/new' do
    if logged_in?
      @student = Student.find(session[:student_id])
      erb :'entries/new_entry'
    else
      redirect '/login'
    end
  end
end
