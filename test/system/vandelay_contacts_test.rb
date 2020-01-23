require "application_system_test_case"

class VandelayContactsTest < ApplicationSystemTestCase
  setup do
    @vandelay_contact = vandelay_contacts(:one)
  end

  test "visiting the index" do
    visit vandelay_contacts_url
    assert_selector "h1", text: "Vandelay Contacts"
  end

  test "creating a Vandelay contact" do
    visit vandelay_contacts_url
    click_on "New Vandelay Contact"

    fill_in "Address 1 city", with: @vandelay_contact.address_1_city
    fill_in "Address 1 line 1", with: @vandelay_contact.address_1_line_1
    fill_in "Address 1 line 2", with: @vandelay_contact.address_1_line_2
    fill_in "Address 1 state", with: @vandelay_contact.address_1_state
    fill_in "Address 1 zip", with: @vandelay_contact.address_1_zip
    fill_in "Address 2 city", with: @vandelay_contact.address_2_city
    fill_in "Address 2 line 1", with: @vandelay_contact.address_2_line_1
    fill_in "Address 2 line 2", with: @vandelay_contact.address_2_line_2
    fill_in "Address 2 state", with: @vandelay_contact.address_2_state
    fill_in "Address 2 zip", with: @vandelay_contact.address_2_zip
    check "Duplicate license" if @vandelay_contact.duplicate_license
    fill_in "First name", with: @vandelay_contact.first_name
    fill_in "Last name", with: @vandelay_contact.last_name
    fill_in "Last update date", with: @vandelay_contact.last_update_date
    fill_in "License number", with: @vandelay_contact.license_number
    fill_in "Middle name", with: @vandelay_contact.middle_name
    fill_in "Phone 1 number", with: @vandelay_contact.phone_1_number
    fill_in "Phone 1 type", with: @vandelay_contact.phone_1_type
    fill_in "Phone 2 number", with: @vandelay_contact.phone_2_number
    fill_in "Phone 2 type", with: @vandelay_contact.phone_2_type
    fill_in "Phone 3 number", with: @vandelay_contact.phone_3_number
    fill_in "Phone 3 type", with: @vandelay_contact.phone_3_type
    check "Valid license" if @vandelay_contact.valid_license
    click_on "Create Vandelay contact"

    assert_text "Vandelay contact was successfully created"
    click_on "Back"
  end

  test "updating a Vandelay contact" do
    visit vandelay_contacts_url
    click_on "Edit", match: :first

    fill_in "Address 1 city", with: @vandelay_contact.address_1_city
    fill_in "Address 1 line 1", with: @vandelay_contact.address_1_line_1
    fill_in "Address 1 line 2", with: @vandelay_contact.address_1_line_2
    fill_in "Address 1 state", with: @vandelay_contact.address_1_state
    fill_in "Address 1 zip", with: @vandelay_contact.address_1_zip
    fill_in "Address 2 city", with: @vandelay_contact.address_2_city
    fill_in "Address 2 line 1", with: @vandelay_contact.address_2_line_1
    fill_in "Address 2 line 2", with: @vandelay_contact.address_2_line_2
    fill_in "Address 2 state", with: @vandelay_contact.address_2_state
    fill_in "Address 2 zip", with: @vandelay_contact.address_2_zip
    check "Duplicate license" if @vandelay_contact.duplicate_license
    fill_in "First name", with: @vandelay_contact.first_name
    fill_in "Last name", with: @vandelay_contact.last_name
    fill_in "Last update date", with: @vandelay_contact.last_update_date
    fill_in "License number", with: @vandelay_contact.license_number
    fill_in "Middle name", with: @vandelay_contact.middle_name
    fill_in "Phone 1 number", with: @vandelay_contact.phone_1_number
    fill_in "Phone 1 type", with: @vandelay_contact.phone_1_type
    fill_in "Phone 2 number", with: @vandelay_contact.phone_2_number
    fill_in "Phone 2 type", with: @vandelay_contact.phone_2_type
    fill_in "Phone 3 number", with: @vandelay_contact.phone_3_number
    fill_in "Phone 3 type", with: @vandelay_contact.phone_3_type
    check "Valid license" if @vandelay_contact.valid_license
    click_on "Update Vandelay contact"

    assert_text "Vandelay contact was successfully updated"
    click_on "Back"
  end

  test "destroying a Vandelay contact" do
    visit vandelay_contacts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Vandelay contact was successfully destroyed"
  end
end
