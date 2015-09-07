# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string           not null
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base

  validates :email, presence: true, uniqueness: true

  has_many(
    :submitted_urls,
    foreign_key: :submitter_id,
    primary_key: :id,
    class_name: :ShortenedUrl
    )

  has_many(
    :visits,
    foreign_key: :user_id,
    primary_key: :id,
    class_name: :Visit
  )

  has_many(
    :visited_urls,
    through: :visits,
    source: :shortened_url
  )

  has_many(
    :distinct_visited_urls,
    -> { distinct },
    through: :visits,
    source: :shortened_url
  )

  def num_recent_submissions
    self.submitted_urls.where("updated_at > ?", 10.minutes.ago).count
  end


end
