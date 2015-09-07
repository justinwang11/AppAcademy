class Goal < ActiveRecord::Base
   validates :title, :user_id, presence: true
   validates :completion, :privacy, inclusion: [true, false]

   belongs_to :user
   has_many :comments, as: :commentable
end
