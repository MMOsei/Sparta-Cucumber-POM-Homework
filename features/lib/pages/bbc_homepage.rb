require 'capybara/dsl'

class BBC_Homepage
  include Capybara::DSL

  #Constants
  HOMEPAGE_URL = 'http://www.bbc.co.uk'
  SIGN_IN_LINK_ID = '#idcta-username'
  REGISTER_LINK_CLASSNAME = 'link--primary'

  def visit_home_page
    visit(HOMEPAGE_URL)
    sleep 2
  end

  def click_sign_in_link
    find(SIGN_IN_LINK_ID).click
    sleep 3
  end

  def click_go_to_register
    click_link('Register now')
    #find(REGISTER_LINK_CLASSNAME).click
    sleep 1
  end

end
