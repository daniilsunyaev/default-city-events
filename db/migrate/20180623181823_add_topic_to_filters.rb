class AddTopicToFilters < ActiveRecord::Migration[5.1]
  def change
    add_column :filters, :topic_id, :bigint, foreign_key: true, index: true
  end
end
