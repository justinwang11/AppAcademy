require 'spec_helper'
require 'rails_helper'

feature "the signup process" do

  it "has a new user page" do
    visit new_user_url
    expect(page).to have_content "Sign Up"
  end

  feature "signing up a user" do

    it "shows username on the homepage after signup" do
      visit new_user_url
      fill_in('Username', with: "Test")
      fill_in('Password', with: "password")
      click_button("Sign Up")
      expect(page).to have_content("Test")
    end

  end

end

feature "logging in" do

  let(:user) { FactoryGirl.create(:user) }

  it "shows username on the homepage after login" do
    log_in(user)
    expect(page).to have_content(user.username)
  end

end

feature "logging out" do
  let(:user) { FactoryGirl.create(:user) }

  it "begins with logged out state" do
    visit goals_url
    expect(page).to_not have_button("Log Out")
  end

  it "doesn't show username on the homepage after logout" do
    log_in(user)
    expect(page).to have_button("Log Out")
    expect(page).to have_content(user.username)
    log_out
    expect(page).to_not have_content(user.username)
  end
end
