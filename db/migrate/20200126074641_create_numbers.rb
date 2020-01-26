class CreateNumbers < ActiveRecord::Migration[5.2]
  def change
    create_table :numbers do |t|
      t.string :phone_1_number
      t.string :phone_1_type
      t.string :phone_2_number
      t.string :phone_2_type
      t.string :phone_3_number
      t.string :phone_3_type

      t.timestamps
    end
  end
end
