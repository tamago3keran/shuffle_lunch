class User
  include Mongoid::Document
  include Mongoid::Timestamps

  has_one :matching_score_set
  has_many :matching_scores, inverse_of: :owner

  field :first_name, type: String
  field :last_name, type: String

  validates :first_name, presence: true
  validates :last_name, presence: true

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
