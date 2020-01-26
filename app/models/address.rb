class Address < ApplicationRecord
  has_many :join_addresses, dependent: :destroy
  has_many :vandelay_contacts, through: :join_addresses
end
