class AdminUser
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::SecurePassword

  before_save { self.email = email.downcase }

  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :password_digest, type: String

  validates :first_name, presence: true, length: { maximum: 20 }
  validates :last_name, presence: true, length: { maximum: 20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
