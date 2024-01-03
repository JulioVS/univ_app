class LoginsController < ApplicationController
  # Tenemos que excluir al propio proceso de Login de la obligacion de tener 
  # usuario logueado, caso contrario la app quedaria en loop
  skip_before_action :require_user, only: [:new, :create]
  
  def new
    
  end

  def create
    input_email = params[:logins][:email].downcase
    input_pass  = params[:logins][:password]

    student = Student.find_by(email: input_email)

    if student && student.authenticate(input_pass)
      # valid user -> store session id
      session[:student_id] = student.id 

      flash[:notice] = "You have successfully logged in"
      redirect_to student
    else
      # invalid user or pass -> send back
      flash.now[:alert] = "Invalid credentials"
      render 'new'
    end
  end

  def destroy
    # delete session
    session[:student_id] = nil 

    flash[:notice] = "You have successfully logged out"
    redirect_to root_path
end
end