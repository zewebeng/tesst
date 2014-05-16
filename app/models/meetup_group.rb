class MeetupGroup < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'
  has_many :memberships
  has_many :activities

  validates :topic, :home_town, :incepted_at, :owner_id, presence: true

  after_create do
    Membership.create!(user: owner, meetup_group: self)
  end
end
