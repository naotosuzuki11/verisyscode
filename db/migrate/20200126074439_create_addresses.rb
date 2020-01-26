class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :address_1_line_1
      t.string :address_1_line_2
      t.string :address_1_city
      t.string :address_1_state
      t.string :address_1_zip
      t.string :address_2_line_1
      t.string :address_2_line_2
      t.string :address_2_city
      t.string :address_2_state
      t.string :address_2_zip

      t.timestamps
    end
  end
end
