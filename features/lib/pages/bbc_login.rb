require 'capybara/dsl'

class BBC_Login
  include Capybara::DSL

  #Constants
  USERNAME = 'username'
  EMAIL_INPUT = 'user-identifier-input'
  DUMMY_EMAIL = 'saphira.lachelle@lm0k.com'
  WRONG_DUMMY_EMAIL = 'saphira.lachelle@lm0k'
  PASSWORD_INPUT = 'password'
  DUMMY_PASSWORD = 'Sparta2018'
  WRONG_DUMMY_PASSWORD = 'Sparta'
  ERROR_MSG = '.form-message__text'

  def fill_email
    fill_in USERNAME, with: DUMMY_EMAIL
    sleep 1
  end

  def fill_email_reg
    fill_in EMAIL_INPUT, with: DUMMY_EMAIL
    sleep 1
  end

  def fill_wrong_email
    fill_in USERNAME, with: WRONG_DUMMY_EMAIL
    sleep 1
  end

  def fill_password
    fill_in PASSWORD_INPUT, with: DUMMY_PASSWORD
    sleep 1
  end

  def fill_wrong_password
    fill_in PASSWORD_INPUT, with: WRONG_DUMMY_PASSWORD
    sleep 1
  end

  def click_submit
    click_button 'Sign in'
    sleep 1
  end

  def verify_login
    page.has_content?('')
    sleep 1
  end

  def error_text
    find(ERROR_MSG).text
    sleep 5
  end

  def wrong_email_error
    sleep 2
    page.has_content?("Sorry, that email doesn’t look right")
  end

  def wrong_password_error
    sleep 2
    page.has_content?("Sorry, that password is too short. It needs to be eight characters or more.")
    # Sorry, that password isn't valid. Please include something that isn't a lette
  end

  def click_account
    click_link 'Your account'
    sleep 1
  end

  def click_sign_out_button
    click_link 'Sign out'
    
  end

  def click_email_box
    find('user-identifier-input').click
  end

  def click_page
    find('#signin-page').click
  end
end
