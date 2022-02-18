class Post < ApplicationRecord
    belongs_to :user

    has_many :comments, dependent: :destroy

    scope :latests, -> { order('created_at DESC')}
end
