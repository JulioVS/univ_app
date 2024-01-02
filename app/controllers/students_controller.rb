class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update]
  
  def index
    @students = Student.all 
  end

  def show
    # Llamada implícita a set_student
  end

  def new
    @student = Student.new 
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      flash[:notice] = "You have successfully signed up"
      redirect_to @student
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    # Llamada implícita a set_student
  end

  def update
    # Llamada implícita a set_student

    if @student.update(student_params)
      flash[:notice] = "You have successfully updated your profile"
      redirect_to @student 
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:name, :email, :password, :password_confirmation) 
  end

end