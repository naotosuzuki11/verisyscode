class Number < ApplicationRecord
  belongs_to :vandelay_contact

  def merge_owner_name
    @merge_owner_name ||= vandelay_contact.first_name
  end

  def merge_owner
    @merge_owner ||= vandelay_contact
  end

end
