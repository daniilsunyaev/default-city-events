class Filter < ApplicationRecord
  belongs_to :town, optional: true
  belongs_to :topic, optional: true
  belongs_to :user
end
