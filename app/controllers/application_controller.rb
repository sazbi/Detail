class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :sort_start, :sort_end

  protected

  def sort_start
    if params[:start_date].present?
      params[:start_date].to_date
    else
      Date.today.beginning_of_week(:sunday)
    end
  end

  def sort_end
    if params[:end_date].present?
      params[:end_date].to_date
    else
      Date.today.end_of_week(:sunday) + 1.week
    end 
  end

  def authenticate_admin
    if current_user.type != "AdminUser"
      flash[:alert] = "You are not Authorized!"
      redirect_to root_path
    end
  end
  

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
