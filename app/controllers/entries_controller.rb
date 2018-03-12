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
        error_msg = @entry.errors.messages.map do |key, arg|
          arg.map { |value| "#{key} #{value}" }.join(', ')
        end.join(', ') + '.'

        flash[:error] = error_msg
        redirect "/students/#{@student.id}/entries/new"
      end
    end

    get '/entries/:entry_id' do
      if logged_in?
        @student = Student.find(params[:id])
        @entry = Entry.find(params[:entry_id])
        if @student.teacher_id == session[:id]
          erb :'/entries/view_entry'
        else
          redirect '/students'
        end
      else
        redirect '/login'
      end
    end

    get '/entries/:entry_id/edit' do
      if logged_in?
        @student = Student.find(params[:id])
        @entry = Entry.find(params[:entry_id])
        if @student.teacher_id == session[:id]
          erb :"/entries/edit_entry"
        else
          redirect '/students'
        end
      else
        redirect '/login'
      end
    end

    patch '/entries/:entry_id' do
      @student = Student.find(params[:id])
      @entry = Entry.find(params[:entry_id])
      @entry.attributes = params[:entry]
      if @entry.valid?
        @entry.save
        redirect "/students/#{@student.id}/entries/#{@entry.id}"
      else
        error_msg = @entry.errors.messages.map do |key, arg|
          arg.map { |value| "#{key} #{value}" }.join(', ')
        end.join(', ') + '.'

        flash[:error] = error_msg
        redirect "/students/#{@student.id}/entries/#{@entry.id}/edit"
      end
    end

    delete '/entries/:entry_id' do
      if logged_in?
        @student = Student.find(params[:id])
        @entry = Entry.find(params[:entry_id])
        if @student.teacher_id == session[:id]
          @entry.destroy
          redirect "/students/#{@student.id}"
        else
          redirect '/students'
        end
      else
        redirect '/login'
      end
    end

  end # namespace /students/:id
end
