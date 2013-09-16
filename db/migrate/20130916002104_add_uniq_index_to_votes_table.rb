class AddUniqIndexToVotesTable < ActiveRecord::Migration
  def change
  	add_index :votes, [:user_id, :imageable_type, :imageable_id], unique: true
  end
end
