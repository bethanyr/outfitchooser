require 'spec_helper'

feature "creating outfits" do
  scenario "can create an outfit" do
    sign_in_as!(FactoryGirl.create(:confirmed_user))
    shirt = FactoryGirl.create(:shirt, :name => "Purple flowers")
    visit ('/')
    #sign_in_as!(FactoryGirl.create(:confirmed_user))
    click_link 'New Outfit'
    page.select "Purple flowers", :from => 'outfit[shirt_id]'
    fill_in "Dayworn", :with => 'Monday'
    page.select 'July', :from => 'outfit[dateworn(2i)]'
    page.select '2013', :from => 'outfit[dateworn(1i)]'
    page.select '17', :from => 'outfit[dateworn(3i)]'
    click_button 'Create Outfit'
    page.should have_content('Outfit has been added.')
  end
end
