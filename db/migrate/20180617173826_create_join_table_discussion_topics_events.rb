class CreateJoinTableDiscussionTopicsEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :discussion_topics_events do |t|
      t.references :discussion_topic, index: true, foreign_key: true
      t.references :event, index: true, foreign_key: true

      t.timestamps
    end
  end
end
