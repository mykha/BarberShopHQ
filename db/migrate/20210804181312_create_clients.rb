class CreateClients < ActiveRecord::Migration[6.1]
  def change
    create_table :client do |t|
      t.text :name
      t.text :phone
      t.date :datestamp
      t.text :barber
      t.int :color
      t.timestamps
    end
  end
end
