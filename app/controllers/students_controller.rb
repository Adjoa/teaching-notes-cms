class StudentsController < ApplicationController
  get '/students' do
    erb :'/students/index'
  end
end
