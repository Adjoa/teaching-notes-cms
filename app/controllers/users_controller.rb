class UsersController < ApplicationController

  get '/signup' do
    erb :'/users/signup'
  end

  post '/signup' do
    @teacher = Teacher.new(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    if @teacher.valid?
      @teacher.save
      session[user_id] = @teacher.id
    else
      redirect '/signup'
    end
  end

end
