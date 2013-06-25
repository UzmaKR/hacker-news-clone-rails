class Post < ActiveRecord::Base
  attr_accessible :url
  belongs_to :user
  has_many :comments

  validates_presence_of :url



end
