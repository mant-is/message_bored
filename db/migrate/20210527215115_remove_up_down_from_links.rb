class RemoveUpDownFromLinks < ActiveRecord::Migration[6.1]
  def change
    remove_column :links, :up
    remove_column :links, :down
  end
end
