class AddColumnsUpDownToLinks < ActiveRecord::Migration[6.1]
  def change
    add_column :links, :upvotes, :integer, default: 0
    add_column :links, :downvotes, :integer, default: 0
  end
end
