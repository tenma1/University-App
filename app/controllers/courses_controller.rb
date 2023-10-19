class CoursesController < ApplicationController

  # after_action :buy_it, only: :show

  def index
    if params[:sort]
      @courses = Course.order(params[:sort])
    else
      @courses = Courses.all
    end
  end

  # def show
  #   @course = Course.find(params[:id])
  # end

  def search_courses
    if @course = Course.all.find{|course| course.course_name.include?(params[:search])}
      redirect_to course_path(@course)
    end
  end

end
