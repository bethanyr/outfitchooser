require 'spec_helper'
feature "signing in" do
  before do
    FactoryGirl.create(:user, :email => "brook@badoutfits.com")
  end
  scenario 'Signing in via confirmation' do
    open_email "brook@badoutfits.com"

    click_first_link_in_email
    page.should have_content("Your account was successfully confirmed")
    page.should have_content("Signed in as brook@badoutfits.com")
  end

  scenario 'Signing in via form' do
    User.find_by_email('brook@badoutfits.com').confirm!
    visit '/'
    click_link 'Sign in'
    fill_in 'Email', :with => "brook@badoutfits.com"
    fill_in 'Password', :with => "password"
    click_button "Sign in"
    page.should have_content("Signed in successfully.")
  end
end
