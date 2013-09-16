class AddNumVotesToPostTable < ActiveRecord::Migration
  def change
  	add_column :posts, :numvotes, :integer, default: 0
  end
end
