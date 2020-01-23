require 'test_helper'

class VandelayContactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vandelay_contact = vandelay_contacts(:one)
  end

  test "should get index" do
    get vandelay_contacts_url
    assert_response :success
  end

  test "should get new" do
    get new_vandelay_contact_url
    assert_response :success
  end

  test "should create vandelay_contact" do
    assert_difference('VandelayContact.count') do
      post vandelay_contacts_url, params: { vandelay_contact: { address_1_city: @vandelay_contact.address_1_city, address_1_line_1: @vandelay_contact.address_1_line_1, address_1_line_2: @vandelay_contact.address_1_line_2, address_1_state: @vandelay_contact.address_1_state, address_1_zip: @vandelay_contact.address_1_zip, address_2_city: @vandelay_contact.address_2_city, address_2_line_1: @vandelay_contact.address_2_line_1, address_2_line_2: @vandelay_contact.address_2_line_2, address_2_state: @vandelay_contact.address_2_state, address_2_zip: @vandelay_contact.address_2_zip, duplicate_license: @vandelay_contact.duplicate_license, first_name: @vandelay_contact.first_name, last_name: @vandelay_contact.last_name, last_update_date: @vandelay_contact.last_update_date, license_number: @vandelay_contact.license_number, middle_name: @vandelay_contact.middle_name, phone_1_number: @vandelay_contact.phone_1_number, phone_1_type: @vandelay_contact.phone_1_type, phone_2_number: @vandelay_contact.phone_2_number, phone_2_type: @vandelay_contact.phone_2_type, phone_3_number: @vandelay_contact.phone_3_number, phone_3_type: @vandelay_contact.phone_3_type, valid_license: @vandelay_contact.valid_license } }
    end

    assert_redirected_to vandelay_contact_url(VandelayContact.last)
  end

  test "should show vandelay_contact" do
    get vandelay_contact_url(@vandelay_contact)
    assert_response :success
  end

  test "should get edit" do
    get edit_vandelay_contact_url(@vandelay_contact)
    assert_response :success
  end

  test "should update vandelay_contact" do
    patch vandelay_contact_url(@vandelay_contact), params: { vandelay_contact: { address_1_city: @vandelay_contact.address_1_city, address_1_line_1: @vandelay_contact.address_1_line_1, address_1_line_2: @vandelay_contact.address_1_line_2, address_1_state: @vandelay_contact.address_1_state, address_1_zip: @vandelay_contact.address_1_zip, address_2_city: @vandelay_contact.address_2_city, address_2_line_1: @vandelay_contact.address_2_line_1, address_2_line_2: @vandelay_contact.address_2_line_2, address_2_state: @vandelay_contact.address_2_state, address_2_zip: @vandelay_contact.address_2_zip, duplicate_license: @vandelay_contact.duplicate_license, first_name: @vandelay_contact.first_name, last_name: @vandelay_contact.last_name, last_update_date: @vandelay_contact.last_update_date, license_number: @vandelay_contact.license_number, middle_name: @vandelay_contact.middle_name, phone_1_number: @vandelay_contact.phone_1_number, phone_1_type: @vandelay_contact.phone_1_type, phone_2_number: @vandelay_contact.phone_2_number, phone_2_type: @vandelay_contact.phone_2_type, phone_3_number: @vandelay_contact.phone_3_number, phone_3_type: @vandelay_contact.phone_3_type, valid_license: @vandelay_contact.valid_license } }
    assert_redirected_to vandelay_contact_url(@vandelay_contact)
  end

  test "should destroy vandelay_contact" do
    assert_difference('VandelayContact.count', -1) do
      delete vandelay_contact_url(@vandelay_contact)
    end

    assert_redirected_to vandelay_contacts_url
  end
end
