class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :activity_id
      t.integer :user_id

      t.timestamps
    end
  end
end
