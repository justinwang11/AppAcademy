class CatRentalRequest < ActiveRecord::Base
  belongs_to :cat, dependent: :destroy

  validates :cat_id, :start_date, :end_date, :status, presence: true
  validate :no_overlapping_approved_requests
  after_initialize :set_status_to_pending
  # before_validation :approve_or_deny

  def no_overlapping_approved_requests
    if over_lapping?
      errors[:date] << "Overlaps with existing approved rentals!"
    end
  end

  def over_lapping?
    # debugger
    CatRentalRequest.where(cat_id: self.cat_id).each do |rental|
      if rental.status == "APPROVED"
        unless self.start_date > rental.end_date || self.end_date < rental.start_date
          return true unless rental.id == self.id
        end
      end
    end

    false
  end

  # def overlapping_approved_requests
  #   # calls overlapping requests; add a `where`
  #   overlapping_requests.select do |request|
  #     request.status == "APPROVED"
  #   end
  # end

  def overlapping_pending_requests
    # calls overlapping requests; add a `where`
    overlapping_requests.select do |request|
      request.status == "PENDING" unless request.id == self.id
    end
  end

  def overlapping_requests
    # returns all overlapping requests (approved, pending, or denied)
    arr = []
    CatRentalRequest.where(cat_id: self.cat_id).each do |rental|
      unless self.start_date > rental.end_date || self.end_date < rental.start_date
        arr << rental
      end
    end

    arr
  end

  def deny!(arr)
    arr.each do |request|
      request.status = "DENIED"
      request.save
    end
  end

  def approve!
    # set status; deny all overlapping requests
    deny!(overlapping_pending_requests)
    self.status = "APPROVED"
    self.save
  end

  def approved_status
    statuses = ["PENDING", "APPROVED", "DENIED"]
    debugger
    unless statuses.include?(self.status)
      errors[:status] << "Not a valid status!"
    end
  end

  def set_status_to_pending
    self.status ||= "PENDING"
  end
end
