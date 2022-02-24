class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  scope :latests, -> { order('created_at DESC')}
end
