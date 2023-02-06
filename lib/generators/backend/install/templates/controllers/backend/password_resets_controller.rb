class Backend::PasswordResetsController < Backend::BaseController
  skip_before_action :authenticate

  before_action :set_user, only: %i[ edit update ]

  layout "backend/authentication"

  def new
  end

  def edit
  end

  def create
    if @user = Backend::User.find_by(email: params[:email])
      Backend::UserMailer.with(user: @user).password_reset.deliver_later
      redirect_to backend_sign_in_path, notice: "Check your email for reset instructions"
    else
      redirect_to new_backend_password_reset_path, alert: "Sorry, we didn't recognize that email address"
    end
  end

  def update
    if @user.update(user_params)
      redirect_to backend_sign_in_path, notice: "Your password was reset successfully. Please sign in"
    else
      redirect_to edit_backend_password_reset_path(token: params[:token]), alert: @user.errors.first.full_message
    end
  end

  private
    def set_user
      @user = Backend::User.find_signed!(params[:token], purpose: :password_reset)
    rescue
      redirect_to new_backend_password_reset_path, alert: "That password reset link is invalid"
    end

    def user_params
      params.permit(:password, :password_confirmation)
    end
end
