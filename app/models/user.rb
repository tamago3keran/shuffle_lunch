class User
  include Mongoid::Document
  include Mongoid::Timestamps

  has_many :matching_scores, inverse_of: :owner

  field :first_name, type: String
  field :last_name, type: String

  validates :first_name, presence: true
  validates :last_name, presence: true
end
