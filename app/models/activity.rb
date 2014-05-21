class Activity < ActiveRecord::Base
  belongs_to :meetup_group
  has_many :votes,  dependent: :delete_all

  validates :Name, :Location, :Start_at, :Duration, :Description, :meetup_group, presence: true
  validates :Description, length: {minimum: 20}
  validates :Duration, numericality: {greater_than_or_equal_to: 15}



  def vote(user)
    votes.where(user: user).first
  end

  def voted?(user)
    !vote(user).nil?
  end



end
