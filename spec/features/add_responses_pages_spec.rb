require 'rails_helper'

describe 'add a response to a question process' do
  it 'will add a new response to specific question' do
    question1 = FactoryGirl.create(:question)
    sign_in(question1.user)
    visit question_path(question1)
    click_on 'Add Response?'
    fill_in "Answer", :with => "Ruby on Rails, foo!"
    click_on "Create Response"
    expect(page).to have_content "Thank you for your answer."
  end

  it 'will throw an error if an answer is not provided' do
    question1 = FactoryGirl.create(:question)
    sign_in(question1.user)
    visit question_path(question1)
    click_on 'Add Response?'
    click_on "Create Response"
    expect(page).to have_content "Whoops"
  end
end
