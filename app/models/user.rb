class User < ApplicationRecord
  rolify
  extend FriendlyId
  validates :name, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :notifications, as: :recipient, dependent: :destroy

  before_create :add_author_role

  friendly_id :name, use: %i[ slugged history ]

  private

  def should_generate_new_friendly_id?
    name_changed? || slug.blank?
  end

  def add_author_role
    self.add_role(:author)
  end
end
