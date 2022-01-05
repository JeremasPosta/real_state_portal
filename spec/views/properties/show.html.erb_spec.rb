require 'rails_helper'

RSpec.describe "properties/:id", type: :feature do

  it 'render show template', :vcr do
    visit property_url('EB-B5515')
    expect(page).to have_content('')
  end
  
  it 'render required elements', :vcr do
    visit property_url('EB-B5515')
    expect(page).to have_content('Property details:')
    expect(page).to have_content('Public ID')
    expect(page).to have_content('Title')
    expect(page).to have_content('Description')
    expect(page).to have_content('Type')
    expect(page).to have_content('Location')
    expect(page).to have_content('Image')
    expect(page).to have_content('Contact')
  end

  it 'render corrects element quantity', :vcr do
    visit property_url('EB-B5515')
    expect(page).to have_css('article', count: 1)
    expect(page).to have_css('h1', count: 1)
    expect(page).to have_css('li', count: 7)
  end

  it 'renders a property details', :vcr do
    visit property_url('EB-B5515')
    expect(page).to have_selector('p', id: 'property-public-id', text: 'EB-B5515')
  end
end
