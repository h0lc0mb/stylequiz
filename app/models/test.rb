class Test < ActiveRecord::Base
  attr_accessible :started

  validates :started, presence: true
end
