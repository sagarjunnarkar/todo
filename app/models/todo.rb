class Todo < ActiveRecord::Base
  attr_accessible :name, :status, :completed
  validates :name, presence: true, length: { minimum: 4 }
end
