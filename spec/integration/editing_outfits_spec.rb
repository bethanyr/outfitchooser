require 'spec_helper'

feature "editing outfits" do
  scenario "user can edit an outfit" do
    shirt= FactoryGirl.create(:shirt, :name => "Purple flower")
    outfit = FactoryGirl.create(:outfit, :shirt_id => shirt.id, :dayworn => "Monday")
    sign_in_as!(FactoryGirl.create(:confirmed_user))
    visit ('/')
    click_link 'Monday'
    click_link 'Edit Outfit'
    fill_in "Dayworn", :with => 'Tuesday'
    click_button 'Update Outfit'
    page.should have_content('Outfit has been updated.')
    page.should have_content('Tuesday')
    page.should_not have_content('Monday')

  end
end
