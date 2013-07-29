require 'spec_helper'
feature "Delete outfits" do
  scenario "User can delete outfits" do
    user = sign_in_as!(FactoryGirl.create(:confirmed_user, :id => 1))
    shirt = FactoryGirl.create(:shirt, :name => "Purple flowered shirt")
    outfit = FactoryGirl.create(:outfit, :dayworn => "Monday", :user_id => 1)
    #sign_in_as!(FactoryGirl.create(:confirmed_user))
    visit ('/')
    click_link 'Monday'
    click_link 'Delete Outfit'
    page.should have_content('Outfit has been removed.')
    page.should_not have_content('Monday')
  end
end
