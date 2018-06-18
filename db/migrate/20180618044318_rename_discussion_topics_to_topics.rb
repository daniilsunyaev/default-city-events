class RenameDiscussionTopicsToTopics < ActiveRecord::Migration[5.1]
  def change
    rename_table :discussion_topics, :topics

    rename_column :discussions, :discussion_topic_id, :topic_id
  end
end
