def sign_in(user)
  visit root_path
  click_on "Sign In"
  fill_in "Email", :with => user.email
  fill_in "Password", :with => user.password
  click_on "Log in"
end
