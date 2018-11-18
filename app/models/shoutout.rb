class Shoutout < ActiveRecord::Base
  belongs_to :user
  has_many :likes
  validates :content, length: {:minimum => 6}, presence: true
end
