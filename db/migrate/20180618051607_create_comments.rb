class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true, index: true
      t.references :discussion, foreign_key: true, index: true
      t.text :text

      t.timestamps
    end
  end
end
