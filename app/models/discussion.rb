class Discussion < ApplicationRecord
  belongs_to :event
  belongs_to :discussion_topic
end
