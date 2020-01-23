class CreateVandelayContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :vandelay_contacts do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
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
      t.string :phone_1_number
      t.string :phone_1_type
      t.string :phone_2_number
      t.string :phone_2_type
      t.string :phone_3_number
      t.string :phone_3_type
      t.integer :license_number, :limit => 8
      t.date :last_update_date
      t.boolean :valid_license
      t.boolean :duplicate_license

      t.timestamps
    end
  end
end
