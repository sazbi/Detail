class AddStoreToPosts < ActiveRecord::Migration[5.2]
  def change
    add_reference :posts, :store, foreign_key: true
  end
end
