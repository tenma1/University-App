class UsersController < ApplicationController
  
  before_action :authenticate_user!

  def show
    if current_user.role.name == 'Visitor'
      redirect_to root_path
    elsif current_user.role.name == 'Principal'
      principal_info()
    end

    unless User.find(params[:id]) == current_user
      @sub_user = User.find(params[:id])
    end
  end

  def edit
    # @user = current_user
    # unless User.find(params[:id]) == current_user
    #   @user = User.find(params[:id])
    # end
  end
  #This (above and below commented) setup is because if we want the principal to change the info of students on their request.
  def update
    # @user = current_user
    # unless User.find(params[:id]) == current_user
    #   @user = User.find(params[:id])
    # end

    if current_user.update(user_params)
      redirect_to current_user
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def principal_info
    if current_user.institution_type == 'College'
      @all_students = current_user.college.users.where(role_id: 5)
      @all_teachers = current_user.college.users.where(role_id: 2)
    elsif current_user.institution_type == 'School'
      @all_students = current_user.school.users.where(role_id: 5)
      @all_teachers = current_user.school.users.where(role_id: 2)    
    end
  end

  def edit_courses
    @courses = Course.all
    unless params[:selected_course].blank?
      unless current_user.courses.include?(params[:selected_course])
        current_user.courses << params[:selected_course]
      end
    end
  end

  def update_accounting
    payId = params[:payment_id]
    total = current_user.accounting.total_value
    Order.update!(user_id: current_user.id, status: 0)
    Receipt.create!(user_id: current_user.id, amount: total, status: 'Paid', payment_id: payId)
    Accounting.update!(user_id: current_user.id, total_value: total, current_due: 0, credited: 0, other_details: '', other_charges: 0, details: '')
    redirect_to user_path(current_user.id)
  end

  private
  def user_params
    params.require(:user).permit(:name, :age, :subject, :standard, course_ids: [])
    #We did not allow all the params parameter because
    #User can not change its school or college or hostel by himself.
  end

end
