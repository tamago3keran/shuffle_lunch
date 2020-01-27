class Restaurant
  include Mongoid::Document
  include Mongoid::Timestamps

  has_many :groups
  embeds_many :restaurant_notes

  field :name, type: String
  field :url, type: String
  field :description, type: String

  validates :name, presence: true
  validates :url, presence: true

  def self.search(search)
    if search
      find( { name: /search/ } )
    else 
      all
    end
  end
end
