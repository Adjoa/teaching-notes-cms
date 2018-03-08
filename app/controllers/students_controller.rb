class StudentsController < ApplicationController
  get '/students' do
    if logged_in?
      @teacher = Teacher.find(session[:id])
      erb :'/students/index'
    else
      redirect '/login'
    end
  end

  get '/students/new' do
    if logged_in?
      erb :'/students/new_student'
    else
      redirect '/login'
    end
  end

  post '/students' do
    # binding.pry
    # @student = Student.new(params[:student])
    @teacher = Teacher.find(session[:id])
    @student = @teacher.students.build(params[:student])
    if @student.valid?
      @student.save
      redirect '/students'
    else
      redirect '/students/new'
    end
  end

  get '/students/:id' do
    if logged_in?
      if @student.teacher_id == session[:id]
        erb :'/students/view_student'
      else
        redirect '/students'
      end
    else
      redirect '/login'
    end
  end

  get '/students/:id/edit' do
    if logged_in?
      if @student.teacher_id == session[:id]
        erb :'/students/edit_student_info'
      else
        redirect '/students'
      end
    else
      redirect '/login'
    end
  end

end
