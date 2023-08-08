module NotificationHelper
    def current_notifications
        notifications = []
        notifications << Notification.new(notice, :notice) if notice
        notifications << Notification.new(alert, :alert) if alert
        notifications
    end
end
