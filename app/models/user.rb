class User < ActiveRecord::Base
  has_many :invitations, foreign_key: :guest_id, dependent: :destroy
  has_many :events, foreign_key: :host_id
  has_many :attendances, through: :invitations, source: :event

  before_save :downcase_email

  validates :name, presence: true, length: {maximum:50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum:255},
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: {case_sensitive: false}

  has_secure_password
  validates :password, presence: true, length: {minimum:6},
            allow_nil: true

  def downcase_email
    self.email = email.downcase
  end

  def User.create_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(string)
    Digest::SHA1.hexdigest(string)
  end
end
