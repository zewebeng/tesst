class CreateMeetupGroups < ActiveRecord::Migration
  def change
    create_table :meetup_groups do |t|
      t.integer :owner_id
      t.string :topic
      t.date :incepted_at
      t.string :home_town

      t.timestamps
    end
  end
end
