class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :discussion
  has_one :event, through: :discussion
  has_one :topic, through: :discussion

  validates :user, :text, :topic, :event, presence: true

  delegate :full_name, to: :user, prefix: true
end
