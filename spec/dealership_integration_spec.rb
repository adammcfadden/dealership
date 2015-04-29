require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the dealerships path', {:type => :feature}) do
  it('processes user entered dealership info and displays it on the dealership list') do
    visit('/')
    click_link('add_dealership')
    fill_in('dealership_name', :with => "Bob's Cars")
    click_button('submit_dealership')
    expect(page).to have_content("Bob's Cars")
  end
end
