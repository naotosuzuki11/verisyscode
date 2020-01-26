class CreateJoinAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :join_addresses do |t|
      t.references :address
      t.references :vandelay_contact

      t.timestamps
    end
  end
end
