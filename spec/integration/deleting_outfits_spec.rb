require 'spec_helper'
feature "Delete outfits" do
  scenario "User can delete outfits" do
    sign_in_as!(FactoryGirl.create(:confirmed_user))
    shirt= FactoryGirl.create(:shirt, :name => "Purple flower")
    outfit = FactoryGirl.create(:outfit, :shirt_id => shirt.id, :dayworn => "Monday")
    #sign_in_as!(FactoryGirl.create(:confirmed_user))
    visit ('/')
    click_link 'Monday'
    click_link 'Delete Outfit'
    page.should have_content('Outfit has been removed.')
    page.should_not have_content('Monday')
  end
end
