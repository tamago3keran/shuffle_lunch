class RestaurantNote
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :restaurant

  field :group_id, type: String
  field :comment, type: String
  field :writer_name, type: String

  validates :comment, presence: true, length: { maximum: 100 }
  validates :writer_name, presence: true
end
