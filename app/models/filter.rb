class Filter < ApplicationRecord
  belongs_to :town, optional: true
end
