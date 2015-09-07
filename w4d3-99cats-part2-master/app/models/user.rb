class User < ActiveRecord::Base

  has_many(
    :cats,
    foreign_key: :user_id,
    primary_key: :id,
    class_name: :Cat
  )

  validates_presence_of(:user_name, :password_digest)

  has_many(
    :cat_rental_requests
  )

  # after_initialize :ensure_session_token

  def self.find_by_credentials(creds)
    user = User.find_by(user_name: creds[:user_name])
    return nil if user.nil?
    return nil unless user.is_password?(creds[:password])
    user
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64
    self.save!
    self.session_token
  end

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    pw = BCrypt::Password.new(self.password_digest)
    pw.is_password?(password)
  end

end
