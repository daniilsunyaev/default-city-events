class AddUserReferenceToFilters < ActiveRecord::Migration[5.1]
  def change
    add_reference :filters, :user, foreign_key: true, index: true
  end
end
