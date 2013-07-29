require 'spec_helper'

feature "editing outfits" do
  scenario "user can edit an outfit" do
    user = sign_in_as!(FactoryGirl.create(:confirmed_user, :id => 1))
    shirt = FactoryGirl.create(:shirt, :name => "Purple flowered shirt")
    outfit = FactoryGirl.create(:outfit, :dayworn => "Monday", :user_id => 1)
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
