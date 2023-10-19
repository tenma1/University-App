class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :role_id, :age, :institution_type, :college_id, :school_id, :discipline, :subject, :standard, :hostel_id)}

      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password)}
    end

    def after_sign_in_path_for(resource)
      if !resource.class == AdminUser
        return user_path(current_user.id)
      end
    end

end
