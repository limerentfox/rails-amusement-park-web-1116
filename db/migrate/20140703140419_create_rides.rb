class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|
      t.integer :user_id
      t.integer :attraction_id
      t.belongs_to :user, index: true
      t.belongs_to :attraction, index: true

    end
  end
end
