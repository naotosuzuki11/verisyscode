class CreateJoinNumbers < ActiveRecord::Migration[5.2]
  def change
    create_table :join_numbers do |t|
      t.references :number, foreign_key: true
      t.references :vandelay_contact, foreign_key: true

      t.timestamps
    end
  end
end


