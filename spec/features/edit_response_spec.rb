require 'rails_helper'

describe 'the edit an answer process' do
  it 'will edit an answer' do
    response1 = FactoryGirl.create(:response)
    visit question_path(response1.question)
    click_on "Edit Response"
    fill_in "Answer"
    click_on "Update Response"
    expect(page).to have_content "Your response has been updated."
  end
end
