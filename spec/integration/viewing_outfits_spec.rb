require 'spec_helper.rb'

feature "Viewing outfits" do
  scenario "User can view all shirts" do
    sign_in_as!(FactoryGirl.create(:confirmed_user))
    shirt = FactoryGirl.create(:shirt, :name => "Purple flowered shirt")
    outfit = FactoryGirl.create(:outfit, :dayworn => "Monday")
    visit ('/')
    page.should have_content("Purple flowered shirt")
    page.should have_title ("Outfit Tracker")
    page.should have_content ("Monday")
  end
end
