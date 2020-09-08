class CreateInstruments < ActiveRecord::Migration[5.2]
  def change
    create_table :instruments do |t|
      t.integer :user_id
      t.string :title
      t.text :description
      t.string :image_id
      t.integer :price

      t.timestamps
    end
  end
end
