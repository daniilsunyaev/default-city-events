class CreateFilters < ActiveRecord::Migration[5.1]
  def change
    create_table :filters do |t|
      t.references :town, index: true, foreign_key: true

      t.timestamps
    end
  end
end
