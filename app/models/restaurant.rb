class Restaurant
  include Mongoid::Document

  has_many :groups
  embeds_many :restaurant_notes

  field :name, type: String
  field :url, type: String
  field :description, type: String

  validates :name, presence: true
  validates :url, persence: true
end
