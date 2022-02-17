class Post < ApplicationRecord
    belongs_to :user

    scope :latests, -> { order('created_at DESC')}
end
