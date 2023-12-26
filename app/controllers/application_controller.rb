class ApplicationController < ActionController::Base
  before_action :set_default_subscription

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

