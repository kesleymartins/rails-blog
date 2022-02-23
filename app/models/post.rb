class Post < ApplicationRecord
    validates :title, presence: true, length: { in: 3..40  }
    validates :body, presence: true, length: { minimum: 5 }
    
    belongs_to :user

    has_many :comments, dependent: :destroy

    scope :latests, -> { order('created_at DESC')}
end
