class PagesController < ApplicationController

  def home

  end

  def upload

  end

  def review

    @all = VandelayContact.all
    @valid = VandelayContact.where(valid_license: true)
    @notvalid = VandelayContact.where(valid_license: false)

  end

end
