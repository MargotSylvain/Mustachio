class AddForeignkeysToFriendships < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :friendships, :users, column: "friend_id"
    add_foreign_key :friendships, :users, column: "user_id"
    add_index :friendships, :friend_id
    add_index :friendships, :user_id
  end
end
