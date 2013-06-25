class User < ActiveRecord::Base
    attr_accessible :name, :email, :password

    has_many :posts
    validates_presence_of :name
    validates_presence_of :email
    validates_email_format_of :email

    has_secure_password
    validates_presence_of :password, :length => {minimum: 8}, :on => :create
end
