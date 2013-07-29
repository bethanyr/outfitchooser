require 'spec_helper'
feature "Delete shirts" do
  scenario "User can delete shirts" do
    shirt= FactoryGirl.create(:shirt, :name => "Purple flower")
    #sign_in_as!(FactoryGirl.create(:confirmed_user))
    visit ('/')
    click_link 'Purple flower'
    click_link 'Delete Shirt'
    page.should have_content('Shirt has been removed from your warddrobe.')
    page.should_not have_content('Purple flower')
  end
end
