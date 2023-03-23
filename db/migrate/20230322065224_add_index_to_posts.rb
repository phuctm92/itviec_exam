class AddIndexToPosts < ActiveRecord::Migration[7.0]
  def up
    add_index :posts, :user_id
  end

  def down
    remove_index :posts, :user_id
  end
end
