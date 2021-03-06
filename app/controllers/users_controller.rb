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
      @teacher.save
      session[:id] = @teacher.id

      flash[:login] = "Successfully logged in!"
      redirect '/students'
    else
      flash[:error] = errors_found(@teacher)
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

      flash[:login] = "Successfully logged in!"
      redirect '/students'
    else
      error_msg = "Invalid username or password"
      flash[:error] = error_msg
      redirect '/login'
    end
  end

  get '/logout' do
    if logged_in?
      logout

      flash[:logout] = "You've been logged out."
      redirect '/'
    else
      redirect '/'
    end
  end

end
