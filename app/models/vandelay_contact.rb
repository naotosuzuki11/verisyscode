class VandelayContact < ApplicationRecord
  has_many :numbers
  has_many :addresses

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      allinfo = {
        first_name: row[0],
        middle_name: row[1],
        last_name: row[2],
        address_1_line_1: row[3],
        address_1_line_2: row[4],
        address_1_city: row[5],
        address_1_state: row[6],
        address_1_zip: row[7],
        address_2_line_1: row[8],
        address_2_line_2: row[9],
        address_2_city: row[10],
        address_2_state: row[11],
        address_2_zip: row[12],
        phone_1_number: row[13],
        phone_1_type: row[14],
        phone_2_number: row[15],
        phone_2_type: row[16],
        phone_3_number: row[17],
        phone_3_type: row[18],
        license_number: row[19],
        last_update_date: row[20]
      }

      contact = VandelayContact.create!(allinfo)

    end

  end

end


# standardize phone number format
# numberone = contact.phone_1_number.to_s
# numbertwo = contact.phone_2_number.to_s
# numberthree = contact.phone_3_number.to_s

# if numberone.gsub(/\D/, "").match(/^1?(\d{3})(\d{3})(\d{4})/)
#   x = $1
#   y = $2
#   z = $3
#   contact.phone_1_number = "(#{x})-#{y}-#{z}"
#   contact.save!
# end


# if numbertwo.gsub(/\D/, "").match(/^1?(\d{3})(\d{3})(\d{4})/)
#   x = $1
#   y = $2
#   z = $3
#   contact.phone_2_number = "(#{x})-#{y}-#{z}"
#   contact.save!
# end


# if numberthree.gsub(/\D/, "").match(/^1?(\d{3})(\d{3})(\d{4})/)
#   x = $1
#   y = $2
#   z = $3
#   contact.phone_3_number = "(#{x})-#{y}-#{z}"
#   contact.save!
# end
