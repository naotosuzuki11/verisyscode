class VandelayContact < ApplicationRecord

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      contactinfo = {
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


      contact = VandelayContact.create!(contactinfo)


      if contact.license_number == nil
        contact.valid_license = false
        contact.save!
      elsif contact.license_number.digits.count != 10
        contact.valid_license = false
        contact.save!
      elsif contact.license_number.to_s.chars.map(&:to_i)[0..8].sum % 10 != contact.license_number.to_s.chars.map(&:to_i)[9]
        contact.valid_license = false
        contact.save!
      else
        contact.valid_license = true
        contact.save!
      end

      numberone = contact.phone_1_number.to_s
      numbertwo = contact.phone_2_number.to_s
      numberthree = contact.phone_3_number.to_s


      if numberone.gsub(/\D/, "").match(/^1?(\d{3})(\d{3})(\d{4})/)
        x = $1
        y = $2
        z = $3
        contact.phone_1_number = "(#{x})-#{y}-#{z}"
        contact.save!
      end


      if numbertwo.gsub(/\D/, "").match(/^1?(\d{3})(\d{3})(\d{4})/)
        x = $1
        y = $2
        z = $3
        contact.phone_2_number = "(#{x})-#{y}-#{z}"
        contact.save!
      end


      if numberthree.gsub(/\D/, "").match(/^1?(\d{3})(\d{3})(\d{4})/)
        x = $1
        y = $2
        z = $3
        contact.phone_3_number = "(#{x})-#{y}-#{z}"
        contact.save!
      end






    end
  end
end


