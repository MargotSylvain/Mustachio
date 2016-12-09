class AddColumnsToFriendships < ActiveRecord::Migration[5.0]
  def change
    add_column :friendships, :friend_id, :integer
    add_column :friendships, :user_id, :integer
  end
end
