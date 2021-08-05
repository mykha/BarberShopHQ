class CreateBarbers < ActiveRecord::Migration[6.1]
  def change
    create_table :barbers do |t|
      t.text :name
      t.timestamps
    end

    Barber.create name: "Jessie Pinkman"
    Barber.create name: "Gus Frig"
    Barber.create name: "Bob Dillan"
  end
end