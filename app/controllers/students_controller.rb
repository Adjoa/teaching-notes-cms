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
    @teacher = Teacher.find(session[:id])
    @student = @teacher.students.build(params[:student])
    if @student.valid?
      @student.save
      redirect '/students'
    else
      flash[:error] = errors_found(@student)
      redirect '/students/new'
    end
  end

  get '/students/:id' do
    if logged_in?
      @student = Student.find(params[:id])
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
      @student = Student.find(params[:id])
      if @student.teacher_id == session[:id]
        erb :'/students/edit_student_info'
      else
        redirect '/students'
      end
    else
      redirect '/login'
    end
  end

  patch '/students/:id' do
    @student = Student.find(params[:id])
    @student.attributes = params[:student]
    if @student.valid?
      @student.save
      redirect "/students/#{@student.id}"
    else
      flash[:error] = errors_found(@student)
      redirect "/students/#{@student.id}/edit"
    end
  end

  delete '/students/:id' do
    if logged_in?
      @student = Student.find(params[:id])
      if @student.teacher_id == session[:id]
        @student.destroy
        redirect '/students'
      else
        redirect '/students'
      end
    else
      redirect '/login'
    end
  end

end
