class AddNumVotesToCommentTable < ActiveRecord::Migration
  def change
  	add_column :comments, :numvotes, :integer, default: 0
  end
end
