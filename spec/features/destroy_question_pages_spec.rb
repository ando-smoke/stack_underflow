require 'rails_helper'

describe 'delete a quesiton process' do
  it "deletes a question" do
    question = FactoryGirl.create(:question)
    visit question_path(question)
    click_on "Delete Question"
    expect(page).to have_content 'destroyed forever'
  end
end
