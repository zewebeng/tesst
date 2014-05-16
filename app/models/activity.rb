class Activity < ActiveRecord::Base
  belongs_to :meetup_group
  has_many :votes

  validates :name, :location, :start_at, :duration, :description, :meetup_group, presence: true
  validates :description, length: {minimum: 20}
  validates :duration, numericality: {greater_than_or_equal_to: 15}
end
