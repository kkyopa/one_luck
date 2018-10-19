class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :configure_account_update_params, if: :devise_controller?
  # def after_sign_in_path_for(resource)
  #   if @user.targets.present?
  #     user_path(@user.id) 
  #   elsif @user.targets.blank?
  #     new_target_path
  #   end
  # end
  
 
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :avatar, targets_attributes: [:content, :point, :image, :image_cache, :user_id, :luck_id]])
  end
  
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar])
  end
end
