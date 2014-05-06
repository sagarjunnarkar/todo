class Todo < ActiveRecord::Base
  attr_accessible :name, :status, :completed
  validates :name, presence: true
end
