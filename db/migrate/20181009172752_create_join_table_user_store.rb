class CreateJoinTableUserStore < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :stores do |t|
      # t.index [:user_id, :store_id]
      # t.index [:store_id, :user_id]
    end
  end
end
