class Activity < ActiveRecord::Base
  belongs_to :meetup_group
  has_many :votes

  validates :Name, :Location, :Start_at, :Duration, :Description, :meetup_group, presence: true
  validates :Description, length: {minimum: 20}
  validates :Duration, numericality: {greater_than_or_equal_to: 15}
end
