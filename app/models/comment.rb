class Comment < ActiveRecord::Base
  validates :commentable_type, presence: true
  validates :commentable_id, presence: true
  validates :content, presence: true

  belongs_to :user
  belongs_to :commentable, :polymorphic => true
  has_many :comments, :as => :commentable

  
	def post
		self.commentable.is_a?(Post) ? self.commentable : self.commentable.post
	end
end