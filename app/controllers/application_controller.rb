class ApplicationController < ActionController::Base
    include Pundit::Authorization
    include Pagy::Backend

    before_action :set_notifications, if: :current_user
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    private

    def user_not_authorized
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to(request.referrer || root_path)
    end

    def set_notifications
      notifications = Notification.where(recipient: current_user).newest_first
      @unread = notifications.unread
      @read = notifications.read
    end
end
