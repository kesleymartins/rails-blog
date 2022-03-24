class Post < ApplicationRecord
    validates :title, presence: true, length: { in: 3..35  }
    validates :body, presence: true, length: { minimum: 5 }

    belongs_to :user

    has_many :comments, dependent: :destroy

    has_noticed_notifications model_name: 'Notification'
    has_many :notifications, through: :user

    scope :from_user, -> (user_id) { where("user_id = ?", user_id) }
end
