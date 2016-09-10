class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password)
  end

  def show
    
  end

   protected

  

  def after_sign_up_path_for(resource)
    profile_path(current_user) 
  end
  
end