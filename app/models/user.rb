class User < ActiveRecord::Base
  has_many :posts
  has_many :votes
  has_many :comments
  validates :name, :presence => true
  validates :email, :presence => true
  validates_uniqueness_of :email
  has_secure_password
  validates_uniqueness_of :email
end