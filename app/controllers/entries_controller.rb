class EntriesController < ApplicationController
  namespace '/students/:id' do
    get '/entries/new' do
      if logged_in?
        @student = Student.find(params[:id])
        erb :'entries/new_entry'
      else
        redirect '/login'
      end
    end

    post '/entries' do
      @student = Student.find(params[:id])
      @entry = @student.entries.build(params[:entry])
      if @entry.valid?
        @entry.save
        redirect "/students/#{@student.id}"
      else
        redirect '/entries/new'
      end
    end

    get '/entries/:entry_id' do
      # binding.pry
      @student = Student.find(params[:id])
      @entry = Entry.find(params[:entry_id])
      erb :'/entries/view_entry'
    end
  end

end
