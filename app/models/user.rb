class User < ApplicationRecord
  has_many :posts, class_name: 'Post', foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  after_initialize :set_defaults

  def set_defaults
    self.posts_counter = [posts.count, 0].max
  end

  def three_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
