def create_visitor
  @visitor ||= { :email => "example@example.com", :password => "changeme", :password_confirmation => "changeme"}
end

def find_user
  @user ||= User.where(:email => @visitor[:email]).first
end

def create_unconfirmed_user
  create_visitor
  delete_user
  sign_up
  visit '/users/sign_out'
end

def create_user
  create_visitor
  delete_user
  @user = FactoryGirl.create(:user, @visitor)
end

def create_voting
  @voting = FactoryGirl.create(:voting)
end

def delete_user
  @user ||= User.where(:email => @visitor[:email]).first
  @user.destroy unless @user.nil?
end

def sign_up
  delete_user
  visit '/users/sign_up'
  fill_in "user_email", :with => @visitor[:email]
  fill_in "user_password", :with => @visitor[:password]
  fill_in "user_password_confirmation", :with => @visitor[:password_confirmation]
  click_button "Sign up"
  find_user
end

def sign_in
  visit '/users/sign_in'
  fill_in "user_email", :with => @visitor[:email]
  fill_in "user_password", :with => @visitor[:password]
  click_button "Log in"
end

### GIVEN ###
Given /^I am not logged in$/ do
  visit '/users/sign_out'
end

Given /^I am logged in$/ do
  create_user
  sign_in
end

Given /^I exist as a user$/ do
  create_user
end

Given /^I do not exist as a user$/ do
  create_visitor
  delete_user
end

Given /^I exist as an unconfirmed user$/ do
  create_unconfirmed_user
end

### WHEN ###
When /^I sign in with valid credentials$/ do
  create_visitor
  sign_in
end

When /^I sign out$/ do
  visit '/users/sign_out'
end

When /^I sign up with valid user data$/ do
  create_visitor
  sign_up
end

When /^An exiting voting is open$/ do
  create_voting
end

When /^I sign up with an invalid email$/ do
  create_visitor
  @visitor = @visitor.merge(:email => "notanemail")
  sign_up
end

When /^I sign up without a password confirmation$/ do
  create_visitor
  @visitor = @visitor.merge(:password_confirmation => "")
  sign_up
end

When /^I sign up with a short password$/ do
  create_visitor
  @visitor = @visitor.merge(:password => "short")
  sign_up
end

When /^I sign up without a password$/ do
  create_visitor
  @visitor = @visitor.merge(:password => "")
  sign_up
end

When /^I sign up with a mismatched password confirmation$/ do
  create_visitor
  @visitor = @visitor.merge(:password_confirmation => "changeme123")
  sign_up
end

When /^I return to the site$/ do
  visit '/'
end

When /^I sign in with a wrong email$/ do
  @visitor = @visitor.merge(:email => "wrong@example.com")
  sign_in
end

When /^I sign in with a wrong password$/ do
  @visitor = @visitor.merge(:password => "wrongpass")
  sign_in
end

When /^I edit my account details$/ do
  click_link "Edit account"
  fill_in "user_name", :with => "newname"
  fill_in "user_current_password", :with => @visitor[:password]
  click_button "Update"
end

When /^I look at the list of users$/ do
  visit '/'
end

### THEN ###
Then /^I should see the same page$/ do
  expect(page).to have_content "Log in"
  expect(page).to have_content "Email"
  expect(page).to have_content "Sign up"
  expect(page).to have_content "Forgot your password?"
end

Then /^I should see dashboard page$/ do
  expect(page).to have_link("How it works")
  expect(page).to have_css("div.header__banner")
  expect(page).to have_css("img.header__logo")
  expect(page).to have_css("main.main")
  expect(page).to have_css("footer.footer")
end

Then /^I should be signed in$/ do
  expect(page).to have_link("Sign Out")
  expect(page).to have_no_link("Log in")
end

Then /^I should be signed out$/ do
  expect(page).to have_link("Sign In")
  expect(page).to have_link("How it works")
  expect(page).to have_no_link("Sign Out")
end

Then /^I should see an invalid email message$/ do
  expect(page).to have_content("Email is invalid")
end

Then /^I should see a missing password message$/ do
  expect(page).to have_content("Password can't be blank")
end

Then /^I should see a short password message$/ do
  expect(page).to have_content("Password is too short (minimum is 8 characters)")
end

Then /^I should see a missing password confirmation message$/ do
  expect(page).to have_content("Password confirmation doesn't match Password")
end

Then /^I should see a mismatched password message$/ do
  expect(page).to have_content("Password confirmation doesn't match Password")
end

Then /^I see an invalid login message$/ do
  expect(page).to have_content("Invalid email or password.")
end

Then /^I show see the message to add my recommendations$/ do
  visit '/'
  expect(page).to have_content("What are you waiting for?")
  expect(page).to have_content("Go ahead and add your recommendations for")
  expect(page).to have_link("Add my recommendations")
end

Then /^I should see the form for update voting/ do
  expect(page).to have_content("Add up to two recommendations")
  expect(page).to have_content("Title")
end

Then /^I should see my recommendations/ do
  expect(page).to have_content("My recommendations")
end

Then /^I should redirect to login/ do
  visit new_user_session_path
end

And /^I clicked on add my recommendations/ do
  visit voting_path(@voting.id)
end
