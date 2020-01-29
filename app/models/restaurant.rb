class Restaurant
  include Mongoid::Document
  include Mongoid::Timestamps
  include SimpleEnum::Mongoid

  has_many :groups
  embeds_many :restaurant_notes

  field :name, type: String
  field :url, type: String
  field :description, type: String

  as_enum :genre, [
    :"和食",
    :"寿司",
    :"鍋料理",
    :"揚げ物",
    :"こなもん",
    :"丼ぶり",
    :"そば・うどん",
    :"ラーメン",
    :"肉料理",
    :"郷土料理",
    :"洋食",
    :"イタリアン",
    :"アメリカン",
    :"中華料理",
    :"韓国料理",
    :"インド料理",
    :"アジアン",
    :"世界の料理"
  ]

  validates :name, presence: true, uniqueness: true
  VALID_URL_REGEX = /\A#{URI::regexp(%w(http https))}\z/
  validates :url, presence: true, uniqueness: true, format: VALID_URL_REGEX

  scope :random, -> { skip(rand(self.count)) }
end
