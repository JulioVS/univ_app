class StudentCoursesController < ApplicationController

  def create
    student = current_user
    course  = Course.find(params[:course_id])
    title   = "#{course.short_name}: #{course.name}"

    if !student.courses.include?(course)
      student.courses.append(course)
  
      flash[:notice] = "You have succesfully enrolled in #{title}"
      redirect_to student 
    else
      flash[:alert]  = "You are already enrolled in #{title}"
      redirect_to root_path
    end
  end
  
end