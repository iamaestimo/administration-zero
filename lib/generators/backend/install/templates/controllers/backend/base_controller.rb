class Backend::BaseController < ActionController::Base
  include Pagy::Backend

  before_action :set_time_zone
  before_action :authenticate

  def set_time_zone
    Time.zone = cookies[:time_zone]
  end

  def authenticate
    if user = Backend::User.find_by_id(session[:backend_user_id])
      Backend::Current.user = user
    else
      redirect_to backend_sign_in_path
    end
  end
end
