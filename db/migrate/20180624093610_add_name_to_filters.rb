class AddNameToFilters < ActiveRecord::Migration[5.1]
  def change
    add_column :filters, :name, :string, null: false
  end
end
