require 'spec_helper'
require 'rails_helper'

feature "the creation process" do
  let(:user) { FactoryGirl.create(:user) }

  it "has a new goal page" do
    log_in(user)
    visit new_goal_url
    expect(page).to have_content "New Goal"
  end

  feature "creating a valid goal" do

    let(:goal) { FactoryGirl.create(:goal) }

    it "goes to the goal's show page" do
      log_in(user)
      create_goal(goal)
      expect(page).to have_content(goal.title)
    end

  end

  feature "creating an invalid goal" do

    it "raises an error" do
      log_in(user)
      visit new_goal_url
      click_button("Create Goal")
      expect(page).to have_content("Title can't be blank")
    end

  end

end

feature "the read process" do

  let(:user) { FactoryGirl.create(:user) }
  let(:other_user) { FactoryGirl.create(:other_user) }
  let(:goal) { FactoryGirl.create(:goal) }
  let(:public_completed_goal) { FactoryGirl.create(:public_completed_goal)}
  let(:private_completed_goal) { FactoryGirl.create(:private_completed_goal)}
  let(:private_incomplete_goal) { FactoryGirl.create(:private_incomplete_goal)}

  before(:each) do
    log_in(user)
  end

  it "has it's own goal show page" do
    visit goal_url(goal)
    expect(page).to have_content(goal.title)
  end

  it "shows completed goal" do
    visit goal_url(public_completed_goal)
    expect(page).to have_content("Completed")
  end

  it "shows incomplete goal" do
    visit goal_url(private_incomplete_goal)
    expect(page).to have_content("Incomplete")
  end

  it "displays all public goals on the index" do
    create_goal(public_completed_goal)
    visit goals_url
    expect(page).to have_content(public_completed_goal.title)
  end

  it "doesn't display another user's private goal on the index" do
    log_out
    log_in(other_user)
    create_goal(private_completed_goal)
    log_out
    log_in(user)
    visit goals_url
    expect(page).to_not have_content(private_completed_goal.title)
  end

end

feature "the update process" do

  let(:user) { FactoryGirl.create(:user) }
  let(:goal) { FactoryGirl.create(:goal) }

  before(:each) do
    log_in(user)
  end

  it "redirects to the goal show page upon successful update" do
    visit edit_goal_url(goal)
    fill_in('Title', with: "new_title")
    click_button("Update Goal")
    expect(page).to have_content("new_title")
  end

  it "raises an error for invalid update" do
    visit edit_goal_url(goal)
    fill_in('Title', with: "")
    click_button("Update Goal")
    expect(page).to have_content("Title can't be blank")
  end

end

feature "the delete process" do
  let(:user) { FactoryGirl.create(:user) }

  before(:each) do
    log_in(user)
  end

  it "deletes a goal" do
    goal = FactoryGirl.create(:goal)
    delete_goal(goal)
    expect(page).to_not have_content(goal.title)
  end

end
