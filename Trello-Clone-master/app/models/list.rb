class List < ActiveRecord::Base

  belongs_to :board

  has_many :cards

  has_many :todo_items, through: :cards

  validates :title, presence: true


end
