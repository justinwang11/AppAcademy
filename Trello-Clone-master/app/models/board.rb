class Board < ActiveRecord::Base

  has_many :lists

  has_many :cards, through: :lists

  has_many :todo_items, through: :cards
  
  validates :title, presence: true

end
