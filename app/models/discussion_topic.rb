class DiscussionTopic < ApplicationRecord
  has_many :discussions
  has_many :events, through: :discussions

  validates :name, presence: true
end
