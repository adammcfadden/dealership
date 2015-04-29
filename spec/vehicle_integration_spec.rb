require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application

describe('the vehicle path', {:type => :feature}) do
  it('takes the user to a list of vehicles') do
    visit('/')
    click_link('vehicle_list')
    expect(page).to have_content('Here is a list of vehicles:')
  end
end
