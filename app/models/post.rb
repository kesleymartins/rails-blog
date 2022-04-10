class Post < ApplicationRecord
  extend FriendlyId

  validates :title, presence: true, length: { in: 3..144 }
  validates :body, presence: true, length: { minimum: 5 }

  belongs_to :user

  has_many :comments, dependent: :destroy

  has_noticed_notifications model_name: 'Notification'
  has_many :notifications, through: :user

  scope :from_user, -> (user_id) { where("user_id = ?", user_id) }

  friendly_id :title, use: %i[ slugged history ]

  private

  def should_generate_new_friendly_id?
    title_changed? || slug.blank?
  end
end
