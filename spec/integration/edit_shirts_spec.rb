require 'spec_helper'

feature "editing shirts" do
  scenario "user can edit a shirt" do
    shirt= FactoryGirl.create(:shirt, :name => "Purple flower")
    sign_in_as!(FactoryGirl.create(:confirmed_user))
    visit ('/')
    click_link 'Purple flower'
    click_link 'Edit Shirt'
    fill_in "Name", :with => 'Pink and green flowers'
    fill_in "Color", :with => 'Pink'
    fill_in "Rating", :with => '2'
    click_button 'Update Shirt'
    page.should have_content('Shirt has been updated.')
    page.should have_content('Pink and green flowers')
    page.should_not have_content('Purple flower')

  end
end
