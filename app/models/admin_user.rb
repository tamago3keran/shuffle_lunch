class AdminUser
  include Mongoid::Document
  include Mongoid::Timestamps

  field :email, type: String
  field :password, type: String
  field :first_name, type: String
  field :last_name, type: String

  validates :email, presence: true
  validates :password, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
end
