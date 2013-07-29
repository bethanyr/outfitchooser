require 'spec_helper'

feature "adding shirts" do
  scenario "can add shirts" do
    visit ('/')
    sign_in_as!(FactoryGirl.create(:confirmed_user))
    click_link 'New Shirt'
    fill_in "Name", :with => 'Purple flowers'
    fill_in "Color", :with => 'Purple'
    fill_in "Rating", :with => '10'
    click_button 'Create Shirt'
    page.should have_content('Shirt has been added.')
  end
end
