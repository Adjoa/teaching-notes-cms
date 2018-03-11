class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect '/students'
    else
      erb :'/users/signup'
    end
  end

  post '/signup' do
    @teacher = Teacher.new(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    if @teacher.valid?
      # flash[:notice] = "Hooray, Flash is working!"
      @teacher.save
      session[:id] = @teacher.id
      redirect '/students'
    else
      redirect '/signup'
    end
  end

  get '/login' do
    if logged_in?
      redirect '/students'
    else
      erb :'/users/login'
    end
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
    if logged_in?
      logout
      redirect '/'
    else
      redirect '/'
    end
  end

end
