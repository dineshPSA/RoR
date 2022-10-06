class ApplicationController < ActionController::Base
    
    protect_from_forgery with: :exception
    include Pundit::Authorization

    # rescue from pundit by going the function
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
    private
    # alert user for unauthorized usage
    def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
    end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,
        keys: [:name, :email, :password, :password_confirmation])
      devise_parameter_sanitizer.permit(:sign_in,
        keys: [:email, :password])
      devise_parameter_sanitizer.permit(:account_update,
        keys: [:name, :email, :password_confirmation, :current_password])
    end
end
