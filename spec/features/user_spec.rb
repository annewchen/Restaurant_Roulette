require 'spec_helper'
  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, :browser => :chrome)
  end


describe 'The Sign up Process', js: true  do
  context 'New User' do

    it 'can click the signup link and be directed to sigup page' do
      visit '/events'
      within(:css, "p.navbar-text") do
        click_on('Sign up')
      end
      expect(page).to have_content('Email')
    end

    it 'can create a new user and cancel account' do
      visit '/events'
      within(:css, "p.navbar-text") do
        click_on('Sign up')
      end
      within(:css, "form.new_user") do
        fill_in 'Full name', :with => 'Jane Doe'
        fill_in 'Email', :with => 'jane@gmail.com'
        fill_in 'Phone number', :with => '1234567890'
        fill_in 'Password', :with => 'password'
        fill_in 'Password confirmation', :with => 'password'
      end
    end
  end
end

describe 'The Login Process', js: true  do
  context 'Current User' do

    it 'can login as a user' do
      visit '/events'
      within(:css, "p.navbar-text") do
        click_on('Login')
      end
      within(:css, "form.new_user") do
        fill_in 'Email', :with => 'john@gmail.com'
        fill_in 'Password', :with => 'password'
        click_on('Log in')
      end
      expect(page).to have_content('John')
    end

  end
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
