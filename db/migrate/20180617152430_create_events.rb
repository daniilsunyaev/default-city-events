class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.text :description
      t.timestamp :starts_at, null: false
      t.timestamp :ends_at, null: false
      t.references :town, foreign_key: true, index: true

      t.timestamps
    end
  end
end
