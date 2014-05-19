class MeetupGroup < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'
  has_many :memberships, :dependent => :delete_all
  has_many :activities, :dependent => :delete_all


  validates :topic, :home_town, :incepted_at, :owner_id, presence: true


end
