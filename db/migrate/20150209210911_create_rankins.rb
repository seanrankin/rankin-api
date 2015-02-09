class CreateRankins < ActiveRecord::Migration
  def change
    create_table :rankins do |t|
      t.string :first_name
      t.string :last_name
      t.date :birthday
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
