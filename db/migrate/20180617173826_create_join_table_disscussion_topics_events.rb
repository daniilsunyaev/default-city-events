class CreateJoinTableDisscussionTopicsEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :disscussion_topics_events do |t|
      t.references :disscussion_topic, index: true, foreign_key: true
      t.references :event, index: true, foreign_key: true

      t.timestamps
    end
  end
end
