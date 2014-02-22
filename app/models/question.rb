class Question < ActiveRecord::Base
  attr_accessible :item_a, :item_b, :test_id, :win, :lose
  belongs_to :test

  validates :test_id, presence: true
  validates :item_a, presence: true
  validates :item_b, presence: true
  validates :win, presence: true
  validates :lose, presence: true
  default_scope order: 'questions.created_at ASC'
end
