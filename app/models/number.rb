class Number < ApplicationRecord
  has_many :join_numbers, dependent: :destroy
  has_many :vandelay_contacts, through: :join_numbers
end
