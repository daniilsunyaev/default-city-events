class Event < ApplicationRecord
  validates :starts_at, :ends_at, :title, presence: true

  belongs_to :town
  has_many :discussions, dependent: :destroy
  has_many :topics, through: :discussions
end
