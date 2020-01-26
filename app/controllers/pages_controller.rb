class PagesController < ApplicationController

  def home

  end

  def upload

  end

  def review

    @all = VandelayContact.all
    @valid = VandelayContact.where(valid_license: true)
    @notvalid = VandelayContact.where(valid_license: false)



      @all.each do |contact|
        (1..3).each do |i|
          phone_number = contact.attributes["phone_#{i}_number"]
          if phone_number != nil
            phone_number.gsub(/\D/, "").match(/^1?(\d{3})(\d{3})(\d{4})/)
            x = $1
            y = $2
            z = $3
            contact.attributes["phone_#{i}_number"] = "(#{x})-#{y}-#{z}"
            contact.save!
          end
        end
      end

  end

end
