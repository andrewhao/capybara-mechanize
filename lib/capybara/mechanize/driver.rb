require 'capybara/mechanize/browser'

class Capybara::Mechanize::Driver < Capybara::RackTest::Driver
  
  attr_accessor :browser
  def initialize(app, options = {}, &block)
    raise ArgumentError, "mechanize requires a rack application, but none was given" unless app

    @browser = Capybara::Mechanize::Browser.new(self, &block)
    super
  end

  def remote?(url)
    browser.remote?(url)
  end
  
end
