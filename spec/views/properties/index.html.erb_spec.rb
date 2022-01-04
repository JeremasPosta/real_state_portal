require 'rails_helper'

RSpec.describe "properties/index.html.erb", type: :feature do
  it 'shows the right content', :vcr do
    visit properties_path
    expect(page).to have_content('Properties list:')
    expect(page).to have_css('table')
    expect(page).to have_content('Public ID')
    expect(page).to have_content('Title')
    expect(page).to have_content('Type')
    expect(page).to have_content('Location')
    expect(page).to have_content('Image')
  end

  it 'render 15 properties', :vcr do
    visit properties_path
    expect(page).to have_css("tbody tr", :count => 15)
    expect(page).to have_css("tbody tr td img", :count => 15)
  end

  it 'shows a next page button', :vcr do
    visit properties_path
    expect(page).to have_link("Next", :count => 2)
    find_link('Next', match: :first).click
  end

  it 'shows a previous page button', :vcr do
    visit properties_path
    find_link('Next', match: :first).click
    expect(page).to have_link("Previous", :count => 2)
    find_link('Previous', match: :first).click
  end
end
