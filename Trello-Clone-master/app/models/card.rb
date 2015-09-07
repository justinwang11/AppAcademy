class Card < ActiveRecord::Base

  belongs_to :list

  has_many :todo_items

  has_many :card_assignments

  validates :title, presence: true

end
