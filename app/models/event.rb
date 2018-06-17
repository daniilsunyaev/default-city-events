class Event < ApplicationRecord
  validates :starts_at, :ends_at, :title, presence: true

  belongs_to :town
end
