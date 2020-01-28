class PagesController < ApplicationController

  def home

  end

  def upload

  end

  def review

    @all_contacts = VandelayContact.all

    @all_contacts.each do |contact|
      validate_license_number?(contact)
      format_phone_numbers(contact)
      if VandelayContact.where(license_number: contact.license_number).having("count(license_number) > 1").exists?
        merge_contacts(contact)
      end
    end

    @valid_license_contacts = VandelayContact.where(valid_license: true)
    @not_valid_license_contacts = VandelayContact.where(valid_license: false)
    @approved_contacts = VandelayContact.where(valid_license: true).where(merged_record: false)

  end


  private

  def validate_license_number?(contact)
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
    end
  end

  def format_phone_numbers(contact)
    (1..3).each do |i|
      phone_number = contact.attributes["phone_#{i}_number"]
      if phone_number == nil
      else
        if phone_number.gsub(/\D/, "").match(/^1?(\d{3})(\d{3})(\d{4})/)
          x = $1
          y = $2
          z = $3
          if contact.attributes["phone_#{i}_number"] == contact.phone_1_number
            contact.phone_1_number = "(#{x})-#{y}-#{z}"
            contact.save!
          elsif contact.attributes["phone_#{i}_number"] == contact.phone_2_number
            contact.phone_2_number = "(#{x})-#{y}-#{z}"
            contact.save!
          elsif contact.attributes["phone_#{i}_number"] == contact.phone_3_number
            contact.phone_3_number = "(#{x})-#{y}-#{z}"
            contact.save!
          else
          end
        end
      end
    end
  end


  def merge_contacts(contact)
    if VandelayContact.where(license_number: contact.license_number).exists?
      append_info(contact)
    else
    end
  end

  def append_info(contact)
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

    numberinfo = {
      phone_1_number: contact.phone_1_number,
      phone_1_type: contact.phone_1_type,
      phone_2_number: contact.phone_2_number,
      phone_2_type: contact.phone_2_type,
      phone_3_number: contact.phone_3_number,
      phone_3_type: contact.phone_3_type
    }

    master_contact = VandelayContact.where(license_number: contact.license_number).order(last_update_date: :desc).first


    unless master_contact == contact
      if Address.where(addressinfo).exists? && Number.where(numberinfo).exists?
        contact.merged_record = true
        contact.save!
      else
        merged_address = Address.create!(vandelay_contact: master_contact)
        merged_address.update(addressinfo)
        merged_number = Number.create!(vandelay_contact: master_contact)
        merged_number.update(numberinfo)
        # contact.valid_license = false
        contact.merged_record = true
        contact.save!
      end
    end

  end

end
