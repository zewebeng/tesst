class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :Name
      t.string :Location
      t.datetime :Start_at
      t.integer :Duration
      t.text :Description
      t.integer :meetup_group_id
      t.boolean :Definite
      t.integer :votes_count
      t.string :image_url
      t.string :image_link
      t.timestamps
    end
  end
end
