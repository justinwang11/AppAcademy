require 'spec_helper'
require 'rails_helper'

feature "the creation process" do

  let(:user) { FactoryGirl.create(:user) }
  let(:other_user) { FactoryGirl.create(:other_user) }

  feature "commenting on a user" do

    it "has a comment form on user show page" do
      log_in(user)
      visit user_url(user)
      expect(page).to have_content "Add Comment"
    end

    feature "creating a valid comment" do

      it "goes to the user show page" do
        log_in(user)
        visit user_url(user)
        fill_in('Body', with: "This is a comment")
                save_and_open_page
        click_button("Add Comment")
        expect(page).to have_content("This is a comment")
      end

    end

    feature "creating an invalid comment" do

      it "raises an error" do
        log_in(user)
        visit user_url(user)
        click_button("Add Comment")
        expect(page).to have_content("Body can't be blank")
      end

    end

  end

  feature "commenting on a goal" do

    let(:goal) { FactoryGirl.create(:goal) }

    it "has a comment form on goal show page" do
      log_in(user)
      visit goal_url(goal)
      expect(page).to have_content "Add Comment"
    end

    feature "creating a valid comment" do

      it "goes to the goal show page" do
        log_in(user)
        visit goal_url(goal)
        fill_in('Body', with: "This is a comment")
        click_button("Add Comment")
        expect(page).to have_content("This is a comment")
      end

    end

    feature "creating an invalid comment" do

      it "raises an error" do
        log_in(user)
        visit goal_url(goal)
        click_button("Add Comment")
        expect(page).to have_content("Body can't be blank")
      end

    end

  end

end

feature "the delete process" do
  let(:user) { FactoryGirl.create(:user) }
  let(:goal) { FactoryGirl.create(:goal) }

  feature "user comments" do

    before(:each) do
      log_in(user)
      visit user_url(user)
      fill_in('Body', with: "This is a comment")
      click_button("Add Comment")
    end

    it "deletes a comment" do
      visit user_url(user)
      click_button("Delete Comment")
      expect(page).to_not have_content("This is a comment")
    end

  end

  feature "goal comments" do

    before(:each) do
      log_in(user)
      visit goal_url(goal)
      fill_in('Body', with: "This is a comment")
      click_button("Add Comment")
    end

    it "deletes a comment" do
      visit goal_url(goal)
      click_button("Delete Comment")
      expect(page).to_not have_content("This is a comment")
    end

  end

end
