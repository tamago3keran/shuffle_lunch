class User
  include Mongoid::Document
  include Mongoid::Timestamps

  has_one :matching_score_set
  has_many :matching_scores, inverse_of: :owner

  field :first_name, type: String
  field :last_name, type: String
  field :active, type: Boolean, default: true

  validates :first_name, presence: true
  validates :last_name, presence: true

  scope :active, -> { where(active: true) }

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def active?
    self.active
  end
end
