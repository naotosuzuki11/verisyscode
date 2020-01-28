class VandelayContactsController < ApplicationController
  before_action :set_vandelay_contact, only: [:show, :edit, :update, :destroy]

  # GET /vandelay_contacts
  # GET /vandelay_contacts.json
  def index
    @vandelay_contacts = VandelayContact.where(valid_license: true).where(merged_record: false)
  end

  def csv_export
    @vandelay_contacts = VandelayContact.where(valid_license: true).where(merged_record: false)

    respond_to do |format|
      format.xlsx {
        response.headers[
          'Content-Disposition'
        ] = "attachment; filename=verisys_assessment_export.xlsx"
      }
      format.html { render :csv_export }
    end



  end

  # GET /vandelay_contacts/1
  # GET /vandelay_contacts/1.json
  def show
  end

  # GET /vandelay_contacts/new
  def new
    @vandelay_contact = VandelayContact.new
  end

  # GET /vandelay_contacts/1/edit
  def edit
  end

  # POST /vandelay_contacts
  # POST /vandelay_contacts.json
  def create
    @vandelay_contact = VandelayContact.new(vandelay_contact_params)

    respond_to do |format|
      if @vandelay_contact.save
        format.html { redirect_to @vandelay_contact, notice: 'Vandelay contact was successfully created.' }
        format.json { render :show, status: :created, location: @vandelay_contact }
      else
        format.html { render :new }
        format.json { render json: @vandelay_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vandelay_contacts/1
  # PATCH/PUT /vandelay_contacts/1.json
  def update
    respond_to do |format|
      if @vandelay_contact.update(vandelay_contact_params)
        format.html { redirect_to @vandelay_contact, notice: 'Vandelay contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @vandelay_contact }
      else
        format.html { render :edit }
        format.json { render json: @vandelay_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vandelay_contacts/1
  # DELETE /vandelay_contacts/1.json
  def destroy
    @vandelay_contact.destroy
    respond_to do |format|
      format.html { redirect_to vandelay_contacts_url, notice: 'Vandelay contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
    VandelayContact.import(params[:file])
    redirect_to review_path, notice: "Companies Added Successfully"
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_vandelay_contact
    @vandelay_contact = VandelayContact.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def vandelay_contact_params
    params.require(:vandelay_contact).permit(:first_name, :middle_name, :last_name, :address_1_line_1, :address_1_line_2, :address_1_city, :address_1_state, :address_1_zip, :address_2_line_1, :address_2_line_2, :address_2_city, :address_2_state, :address_2_zip, :phone_1_number, :phone_1_type, :phone_2_number, :phone_2_type, :phone_3_number, :phone_3_type, :license_number, :last_update_date, :valid_license, :duplicate_license)
  end
end
