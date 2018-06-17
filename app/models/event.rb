class Event < ApplicationRecord
  validates :starts_at, :ends_at, :title, presence: true

  belongs_to :town
  has_and_belongs_to_many :disscussion_topics
end
