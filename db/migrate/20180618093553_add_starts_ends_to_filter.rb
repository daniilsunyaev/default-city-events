class AddStartsEndsToFilter < ActiveRecord::Migration[5.1]
  def change
    add_column :filters, :min_starts_at, :timestamp
    add_column :filters, :max_starts_at, :timestamp
  end
end
