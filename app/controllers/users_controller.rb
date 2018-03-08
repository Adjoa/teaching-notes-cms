class UsersController < ApplicationController

  get '/signup' do
    erb :'/users/signup'
  end

  post '/signup' do
    @teacher = Teacher.new(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    if @teacher.valid?
      @teacher.save
      session[:id] = @teacher.id
      redirect '/students'
    else
      redirect '/signup'
    end
  end

  get '/login' do
    erb :'/users/login'
  end

  post '/login' do
    @teacher = Teacher.find_by(username: params[:username]).authenticate(params[:password])

    if @teacher
      session[:id] = @teacher.id
      redirect '/students'
    else
      redirect '/login'
    end
  end

  get '/logout' do
    logout
  end

end
