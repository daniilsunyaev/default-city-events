class RenameDiscussionTopicsEventsToDiscussions < ActiveRecord::Migration[5.1]
  def change
    rename_table :discussion_topics_events, :discussions
  end
end
