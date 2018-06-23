class AddTopicToFilters < ActiveRecord::Migration[5.1]
  def change
    add_reference :filters, :topic, foreign_key: true, index: true
  end
end
