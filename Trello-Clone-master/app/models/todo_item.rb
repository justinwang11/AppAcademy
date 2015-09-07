class TodoItem < ActiveRecord::Base

  belongs_to :card

  validates :title, presence: true

end
