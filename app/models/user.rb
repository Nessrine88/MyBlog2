class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts, class_name: 'Post', foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  validates :name, :photo, :bio, presence: true
  validates :posts_counter, numericality: { greater_than_or_equal_to: 0 }

  after_initialize :set_defaults

  def set_defaults
    self.posts_counter = [posts.count, 0].max
  end

  def three_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
