class CreateJoinAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :join_addresses do |t|
      t.references :address, foreign_key: true
      t.references :vandelay_contact, foreign_key: true

      t.timestamps
    end
  end
end
