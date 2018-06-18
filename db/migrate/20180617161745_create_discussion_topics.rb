class CreateDiscussionTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :discussion_topics do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
