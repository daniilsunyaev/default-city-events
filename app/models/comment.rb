class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :event
  belongs_to :discussion

  validates :user, :text, :discussion_topic, :event, presence: true

  delegate :full_name, to: :user, prefix: true
end
