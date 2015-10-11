require "rails_helper"
  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, :browser => :chrome)
  end


describe 'User', js: true  do
  context 'New User' do

    it 'can click the signup link and be directed to sigup page' do
      visit 'root_path'
      within(:css, "p.navbar-text") do
        click_on('Sign up')
      end
      page.has_content?('Email')
    end

    it 'allows you to sign up and enter your email and password and redirects you to your profile' do
      visit root_path
      within(:css, "p.navbar-text") do
        click_on('Sign up')
      end
      fill_in "Email", with: "bison@bison.com"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      within(:css, "form") do
        click_on('Sign up')
      end
      page.has_content?('Your Workouts')
    end

  end
end
