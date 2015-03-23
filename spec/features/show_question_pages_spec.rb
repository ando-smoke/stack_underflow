require 'rails_helper'

describe 'the show question detail process' do
  it 'shows all details for a specific question' do
    question = FactoryGirl.create(:question)
    visit root_path
    click_on "Javascript issue"
    expect(page).to have_content "which framework"
  end
end
