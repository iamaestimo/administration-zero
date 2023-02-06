class Backend::UsersController < Backend::BaseController
  before_action :set_user, only: %i[ show edit update destroy ]

  def index
    @search = Backend::User.all.ransack(params[:q])

    respond_to do |format|
      format.html { @pagy, @users = pagy(@search.result) }
      format.csv  { render csv: @search.result }
    end
  end

  def show
  end

  def new
    @user = Backend::User.new
  end

  def edit
  end

  def create
    @user = Backend::User.new(user_params)

    if @user.save
      redirect_to @user, notice: "User was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "User was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    redirect_to backend_users_url, notice: "User was successfully destroyed."
  end

  private
    def set_user
      @user = Backend::User.find(params[:id])
    end

    def user_params
      params.require(:backend_user).permit(:email, :password, :password_confirmation)
    end
end
