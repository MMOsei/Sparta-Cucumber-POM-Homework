Given("I access the bbc registration page") do
  @bbc_site = BBC_Site.new
  @bbc_site.bbc_homepage.visit_home_page
  @bbc_site.bbc_homepage.click_sign_in_link
  @bbc_site.bbc_homepage.click_go_to_register
end

Given("I click the thirteen or over button") do
  @bbc_site.bbc_registration.click_13_or_over
end

Given("I input a date less that thirteen years in the past") do
  @bbc_site.bbc_registration.input_dob_under_age
end

When("I try to click continue") do
@bbc_site.bbc_registration.click_dob_button
end

Then("I receive an error telling me I need to be thirteen or over") do
  expect(@bbc_site.bbc_registration.wrong_age_error).to be true
end

Given("I click the thirteen or over button with valid age") do
  @bbc_site.bbc_registration.click_13_or_over
  @bbc_site.bbc_registration.input_dob
  @bbc_site.bbc_registration.click_dob_button
end

Given("I input a pre registered email address") do
  @bbc_site.bbc_login.fill_email_reg
  @bbc_site.bbc_registration.fill_in_password
  @bbc_site.bbc_registration.fill_in_postcode
  @bbc_site.bbc_registration.choose_gender
  @bbc_site.bbc_registration.click_email_updates
end

When("I try to click register") do
  @bbc_site.bbc_registration.click_register
end

Then("I receive an error telling me the email is already registered") do
  expect(@bbc_site.bbc_registration.pre_reg_error).to be true
end

Given("I access the bbc registration page with a new dummy email") do
  @bbc_site = BBC_Site.new
  #Go and get new email
  @bbc_site.get_temp_email.visit_minute_inbox
  # @bbc_site.get_temp_email.refresh_email
  @email = @bbc_site.get_temp_email.get_email
  # Start the registration process
  @bbc_site.bbc_homepage.visit_home_page
  @bbc_site.bbc_homepage.click_sign_in_link
  @bbc_site.bbc_homepage.click_go_to_register
end

Given("I input a short and invalid password") do
  @bbc_site.bbc_registration.fill_in_email(@email)
  @bbc_site.bbc_registration.fill_short_password
  @bbc_site.bbc_registration.fill_in_postcode
  @bbc_site.bbc_registration.choose_gender
  @bbc_site.bbc_registration.click_email_updates
end

Then("I receive an error telling me the password is invalid") do
  expect(@bbc_site.bbc_registration.invalid_password_error).to be true
end

Given("I input a city") do
  @bbc_site.bbc_registration.fill_in_email(@email)
  @bbc_site.bbc_registration.fill_in_password
  @bbc_site.bbc_registration.input_city_as_postcode
  @bbc_site.bbc_registration.choose_gender
  @bbc_site.bbc_registration.click_email_updates
end

Given("I skip the email updates section") do
  @bbc_site.bbc_registration.fill_in_email(@email)
  @bbc_site.bbc_registration.fill_in_password
  @bbc_site.bbc_registration.fill_in_postcode
  @bbc_site.bbc_registration.choose_gender
  end

Given("I input a invalid password") do
  @bbc_site.bbc_registration.fill_in_email(@email)
  @bbc_site.bbc_registration.fill_num_only_password
  @bbc_site.bbc_registration.fill_in_postcode
  @bbc_site.bbc_registration.choose_gender
  @bbc_site.bbc_registration.click_email_updates
end

Then("I receive an error telling me the password is too short") do
  expect(@bbc_site.bbc_registration.short_password_error).to be true
end

Then("I receive an error telling me the postcode is invalid") do
  expect(@bbc_site.bbc_registration.wrong_postcode_error).to be true
end

Then("I receive an error telling me that email updates was missed") do
  expect(@bbc_site.bbc_registration.email_updates_error).to be true
end
