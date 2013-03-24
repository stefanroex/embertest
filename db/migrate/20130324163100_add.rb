class Add < ActiveRecord::Migration
  def change
    add_column :events, :type_id, :integer
    add_index :events, :type_id
  end
end
