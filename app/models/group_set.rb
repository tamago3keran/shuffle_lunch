class GroupSet
  include Mongoid::Document
  include Mongoid::Timestamps

  has_many :groups

  field :applied, type: Boolean, default: false

  def applied?
    self.applied
  end

  def save_with_groups
    self.save && self.groups.each { |group| group.save }
  end

  def total_matching_score
    self.groups.sum(&:matching_score)
  end
end
