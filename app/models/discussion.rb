class Discussion < ApplicationRecord
  belongs_to :event
  belongs_to :topic

  has_many :comments, dependent: :destroy

  delegate :name, to: :topic, prefix: true
end
