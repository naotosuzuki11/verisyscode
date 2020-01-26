class VandelayContact < ApplicationRecord
  has_many :join_addresses
  # , dependent: :destroy
  has_many :addresses, through: :join_addresses
  has_many :join_numbers
  # , dependent: :destroy
  has_many :numbers, through: :join_numbers




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

      # validate license number
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


      # standardize phone number format
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
    # end of loop
    end

      allcontacts = VandelayContact.all
      # any license number that appears more than once
      multiplelicensenumbers = VandelayContact.select([:license_number]).group(:license_number).having("count(license_number) > 1").all
      # any instances where license numbers appear more than once
      duplicatenumbercontacts = VandelayContact.where(license_number: multiplelicensenumbers)

      duplicatenumbercontacts.each do |contact|
        contact.duplicate_license = true
        contact.save!
      end

      allcontacts.each do |contact|

        if contact.duplicate_license = true
          numberinfo = {
            phone_1_number: contact.phone_1_number,
            phone_1_type: contact.phone_1_type,
            phone_2_number: contact.phone_2_number,
            phone_2_type: contact.phone_2_type,
            phone_3_number: contact.phone_3_number,
            phone_3_type: contact.phone_3_type
          }

          addressinfo = {
            address_1_line_1:contact.address_1_line_1,
            address_1_line_2:contact.address_1_line_2,
            address_1_city:contact.address_1_city,
            address_1_state:contact.address_1_state,
            address_1_zip:contact.address_1_zip,
            address_2_line_1:contact.address_2_line_1,
            address_2_line_2:contact.address_2_line_2,
            address_2_city:contact.address_2_city,
            address_2_state:contact.address_2_state,
            address_2_zip:contact.address_2_zip,
          }

        mastercontact = VandelayContact.where(license_number: contact.license_number).order(last_update_date: :asc).first
        numbers_to_be_merged = Number.create!(numberinfo)
        address_to_be_merged = Address.create!(addressinfo)
        raise
        JoinAddress.create!(VandelayContact: mastercontact, Address: address_to_be_merged)
        raise






        end

      end

      allcontacts.each do |contact|
        if contact.duplicate_license == true
          currentcontact = VandelayContact.where(license_number: contact.license_number).order(last_update_date: :asc).first
          contact.first_name = currentcontact.first_name
          contact.middle_name = currentcontact.middle_name
          contact.last_name = currentcontact.last_name
          contact.save!
        end
      end


  end

end


