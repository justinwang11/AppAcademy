class Vote < ActiveRecord::Base
  belongs_to :votable, polymorphic: true

  validates :value, presence: true, inclusion: [+1, -1]
  validates :votable, presence: true
end
