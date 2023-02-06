class Backend::SessionsController < Backend::BaseController
  skip_before_action :authenticate, only: %i[ new create ]

  layout "backend/authentication"

  def new
    @user = Backend::User.new
  end

  def create
    @user = Backend::User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      session[:backend_user_id] = @user.id; redirect_to(backend_path)
    else
      redirect_to backend_sign_in_path(email_hint: params[:email]), alert: "That email or password is incorrect"
    end
  end

  def destroy
    session[:backend_user_id] = nil; redirect_to backend_sign_in_path
  end
end
