require 'capybara/dsl'

class BBC_Registration
  include Capybara::DSL

  #Constants

  CONFIRM_BIRTHDAY_LINK = '#submit-button'
  DUMMY_PASSWORD = 'Sparta2018'
  INPUT_POSTCODE = 'TW10 6TF'
  REGISTRATION_SUBMIT = '#submit-button'

  def click_13_or_over
    click_link('13 or over')
    sleep 1
  end

  def input_dob
    fill_in('day-input', with: '16')
    fill_in('month-input', with: '06')
    fill_in('year-input', with: '1986')
  end

  def click_dob_button
    click_button 'Continue'
    sleep 1
  end

  def fill_in_email(email)
    fill_in('user-identifier-input', with: email)
    sleep 1
  end

  def fill_in_password
    fill_in('password-input', with: DUMMY_PASSWORD)
    sleep 1
  end

  def fill_in_postcode
    fill_in('postcode-input', with: INPUT_POSTCODE)
    sleep 1
  end

  def choose_gender
    select 'Female', from: 'Gender'
    sleep 1
  end

  def click_email_updates
    all('.button__text-wrapper')[1].click
    sleep 1
  end

  def click_register
    find(REGISTRATION_SUBMIT).click
    sleep 1
  end

  def verify_registration
    has_content?('You\'re now signed in')
  end

  # Methods for failures
  def input_dob_under_age
    fill_in('day-input', with: '16')
    fill_in('month-input', with: '06')
    fill_in('year-input', with: '2016')
  end

  def fill_short_password
    fill_in('password-input', with: 'short')
    sleep 1
  end

  def fill_letters_only_password
    fill_in('password-input', with: "lolololol")
    sleep 1
  end

  def input_city_as_postcode
    fill_in('postcode-input', with: 'london')
    sleep 1
  end

  # Errors section
  # Error 1
  def wrong_age_error
    page.has_content?('Sorry, you need to be 13 or over.')
  end

  # Error 2
  def pre_reg_error
    has_content?('Looks like you’ve already registered with this email.')
  end

  # Error 3
  def short_password_error
    page.has_content?('Sorry, that password is too short. It needs to be eight characters or more.')
  end

  # Error 4
  def wrong_postcode_error
    page.has_content?("Sorry, that postcode isn't valid. Please check it's a proper postcode.")
  end

  # Error 5
  def email_updates_error
    page.has_content?("Something's missing. Please check and try again.")
  end

  # Error 6
  def invalid_password_error
    page.has_content?("Sorry, that password isn't valid. Please include something that isn't a letter.")
  end

end
