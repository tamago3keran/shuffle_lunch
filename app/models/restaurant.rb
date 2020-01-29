class Restaurant
  include Mongoid::Document
  include Mongoid::Timestamps

  has_many :groups
  embeds_many :restaurant_notes

  field :name, type: String
  field :url, type: String
  field :description, type: String

  validates :name, presence: true, uniqueness: true
  VALID_URL_REGEX = /\A#{URI::regexp(%w(http https))}\z/
  validates :url, presence: true, uniqueness: true, format: VALID_URL_REGEX

  scope :random, -> { skip(rand(self.count)) }
end
