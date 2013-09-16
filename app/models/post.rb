class Post < ActiveRecord::Base
  attr_accessible :url, :numvotes
  belongs_to :user
  has_many :comments
  has_many :votes, as: :imageable

  validates_presence_of :url

end
