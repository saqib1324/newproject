class RegistrationsController < Devise::RegistrationsController
    skip_before_action :require_sessionnly, :only => [:sign_up_params, :account_update_params]
    private
    def sign_up_params
        params.require(:user).permit(:email,:role, :password, :password_confirmation)
    end
    def account_update_params
        params.require(:user).permit(:email,:role, :password, :password_confirmation, :current_password)
    end
end 