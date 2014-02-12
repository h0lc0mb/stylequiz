class Test < ActiveRecord::Base
  attr_accessible :started
  has_many :questions, dependent: :destroy

  validates :started, presence: true
end
