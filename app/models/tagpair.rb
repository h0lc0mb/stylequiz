class Tagpair < ActiveRecord::Base
  attr_accessible :item, :tag_a, :tag_b, :link

  validates :item, presence: true
  validates :tag_a, presence: true
  validates :tag_b, presence: true
  validates :link, presence: true
end