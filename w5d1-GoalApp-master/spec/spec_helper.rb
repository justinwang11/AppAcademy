RSpec.configure do |config|

  config.expect_with :rspec do |expectations|

    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  def log_out
    click_button("Log Out")
  end

  def log_in(user)
    visit new_session_url
    fill_in('Username', with: user.username)
    fill_in('Password', with: user.password)
    click_button("Sign In")
  end

  def create_goal(goal)
    visit new_goal_url
    fill_in('Title', with: goal.title)
    choose("#{goal.privacy ? "Private" : "Public"}")
    choose("#{goal.completion ? "Completed" : "Incomplete"}")
    click_button("Create Goal")
  end

  def delete_goal(goal)
    visit goal_url(goal)
    click_button("Delete Goal")
  end
end
