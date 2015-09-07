class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :author, class_name: :User

  belongs_to :parent, class_name: Comment, foreign_key: :parent_comment_id
  has_many :child_comments, class_name: Comment, foreign_key: :parent_comment_id
  has_many :votes, as: :votable
  validates :content, length: {minimum: 1}

  def score
    score = 0
    votes.each { |vote| score += vote.value }
    score
  end
end
