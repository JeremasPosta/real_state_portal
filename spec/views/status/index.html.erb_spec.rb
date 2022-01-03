require 'rails_helper'

RSpec.describe "status/index.html.erb", type: :feature do
  it 'shows the right content', :vcr do
    visit status_index_path
    expect(page).to have_content('Hello, world!')
    expect(page).to have_content('General Status: OK')
  end
end
