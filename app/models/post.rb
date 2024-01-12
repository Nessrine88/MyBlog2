class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes
  validates :title, presence: true, length: { in: 10..250 }
  validates :comments_counter, :likes_counter, numericality: { greater_than_or_equal_to: 0 }

  after_save :update_post_counters

  def five_recent_comments
    Comment.where(post_id: id).order(created_at: :desc).limit(5)
  end

  private

  def update_post_counters
    author.update(posts_counter: author.posts.count)
  end
end
