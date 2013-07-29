require 'spec_helper.rb'

feature "Viewing outfits" do
  scenario "User can view all shirts" do
    shirt = FactoryGirl.create(:shirt, :name => "Purple flowered shirt")
    visit ('/')
    page.should have_content("Purple flowered shirt")
    page.should have_title ("Outfit Tracker")
  end
end
