require 'rails_helper'

describe 'the destroy a response process' do
  it 'will destroy a response' do
    response1 = FactoryGirl.create(:response)
    sign_in(response1.user)
    visit question_path(response1.question)
    click_on "Delete Response"
    expect(page).to have_content "Your response has been deleted."
  end
end
