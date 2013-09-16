class Vote < ActiveRecord::Base
	attr_accessible :imageable_id, :imageable_type, :user_id
	attr_accessible :numvotes
	belongs_to :imageable, polymorphic: true
	validates_uniqueness_of :user_id, :scope => [:imageable_type, :imageable_id]
end