class Cat < ActiveRecord::Base
  has_many :cat_rental_requests

  validates :birth_date, :name, :sex, :color, presence: true
  validate :proper_color
  validate :proper_sex

  def proper_color
    colors = ["white", "black", "red", "green", "blue", "purple"]
    unless colors.include?(self.color.downcase)
      errors[:color] << "You must choose a valid color."
    end
  end

  def proper_sex
    sexes = ["m", "f"]
    unless sexes.include?(self.sex.downcase)
      errors[:sex] << "You must choose a valid sex."
    end
  end

  def age
    ((Date.today - birth_date)/365).to_i
  end
end
