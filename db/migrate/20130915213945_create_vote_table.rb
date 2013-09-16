class CreateVoteTable < ActiveRecord::Migration
  def change
  	create_table :votes do |t|
  		t.integer :numvotes, :default => 0
  		t.references :imageable, polymorphic: true
  		t.timestamps
  	end
  end
end
