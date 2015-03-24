require 'rails_helper'

describe 'the edit a response process' do
  it 'will edit a response' do
    response1 = FactoryGirl.create(:response)
    sign_in(response1.user)
    visit question_path(response1.question)
    click_on "Edit Response"
    fill_in "Answer", with: "whatever"
    click_on "Update Response"
    expect(page).to have_content "Your response has been updated."
  end
end
