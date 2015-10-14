require 'spec_helper'
  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, :browser => :chrome)
  end

describe 'The creating an event process', js: true  do
  context 'Create an event' do

    it 'can create an event' do
      visit '/events'
      within(:css, "p.navbar-text") do
        click_on('Login')
      end
      within(:css, "form.new_user") do
        fill_in 'Email', :with => 'john@gmail.com'
        fill_in 'Password', :with => 'password'
        click_on('Log in')
      end
      within(:css, "form") do
        fill_in 'event_street_address', :with => 'San Francisco, CA'
        fill_in 'name', :with => 'Jordan'
        fill_in 'phone_number', :with => '123-456-7890'
      end
    end
  end
end
