class StudentsController < ApplicationController
  get '/students' do
    if logged_in?
      erb :'/students/index'
    else
      redirect '/login'
    end
  end
end
