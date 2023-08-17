class RestockAlert < ApplicationRecord
  belongs_to :inventory
  belongs_to :assigned_to, class_name: 'User', foreign_key: 'assigned_to_user_id'
  
  validates :threshold, presence: true
  validates :status, presence: true

  PENDING = 'Pending'
  ACKNOWLEDGED = 'Acknowledged'
  RESOLVED = 'Resolved'
  TRIGGERED = 'Triggered'
  STATUSES = [PENDING, ACKNOWLEDGED, RESOLVED, TRIGGERED]
end

