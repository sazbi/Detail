class AddStoresToServices < ActiveRecord::Migration[5.2]
  def change
    add_reference :services, :store, foreign_key: true
  end
end
