class AddFieldsToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :stk_num, :string
    add_column :posts, :comments, :text
  end
end
