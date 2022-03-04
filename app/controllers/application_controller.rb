class ApplicationController < ActionController::Base
    include Pagy::Backend

    before_action :set_notifications, if: :current_user

    private

    def set_notifications
      notifications = Notification.where(recipient: current_user).newest_first
      @unread = notifications.unread
      @read = notifications.read
    end
end
