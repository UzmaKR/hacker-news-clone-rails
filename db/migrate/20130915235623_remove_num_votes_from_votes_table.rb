class RemoveNumVotesFromVotesTable < ActiveRecord::Migration
  def change
  	remove_column :votes, :numvotes
  end
end
