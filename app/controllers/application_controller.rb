class ApplicationController < ActionController::Base
  before_action :set_default_subscription
  before_action :authenticate_guest

  def authenticate_guest
    if cookies[:guest_token]
     #cookies.delete :guest_token
      @guest = Guest.find_by_token(cookies[:guest_token])
    else
      guest_token = SecureRandom.uuid
      cookies[:guest_token] = guest_token
      @guest = Guest.create!(token: guest_token)

    end
  end
  
  private
  def set_default_subscription
    @subscription = Subscription.new
  end
  
    rescue_from CanCan::AccessDenied do |exception|
      respond_to do |format|
        format.json { head :forbidden }
        format.html { redirect_to root_path, notice: exception.message }
      end
    end

end

