class Post < ActiveRecord::Base
  belongs_to :author, class_name: User

  has_many :post_subs
  has_many :subs, through: :post_subs

  has_many :comments
  has_many :votes, as: :votable

  def top_level_comments
    self.comments.where(parent_comment_id: nil)
  end

  def comments_by_parent_id
    comments_hash = Hash.new { |h,k| h[k] = [] }
    sorted_comments = comments.joins("LEFT JOIN votes ON comments.id = votes.votable_id AND votable_type = 'Comment'")
                              .group("comments.id")
                              .order("sum(votes.value) DESC")
    sorted_comments.includes(:author).each do |comment|
      comments_hash[ comment.parent_comment_id ] << comment
    end

    comments_hash
  end

  def score
    score = 0
    votes.each { |vote| score += vote.value }
    score
  end
end
