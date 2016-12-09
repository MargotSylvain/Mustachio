class RemoveColumnsFromFriendships < ActiveRecord::Migration[5.0]
  def change
    remove_column :friendships, :friend_id
    remove_column :friendships, :user_id
  end
end
