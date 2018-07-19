require 'capybara/dsl'

class TempEmail
  include Capybara::DSL

  HOMEPAGE_URL = 'https://www.minuteinbox.com/'
  EMAIL_TAG = '#email'

  def visit_minute_inbox
    visit(HOMEPAGE_URL)
  end

  def get_email
    find(EMAIL_TAG).text
  end

end
