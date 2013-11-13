class Post < ActiveRecord::Base
  belongs_to :user
  has_many :votes
  has_many :comments, :as => :commentable
  validates :title, :presence => true
  validates :url, :presence => true

  def self.sort_by_votes
    all.sort { |post_a, post_b| post_b.get_score <=> post_a.get_score }
  end

  def get_score
    minutes_since_post = (Time.now - self.created_at.to_time) / 60
    percent_of_day = (200 - minutes_since_post) / 200
    self.votes.count * percent_of_day
  end
end



