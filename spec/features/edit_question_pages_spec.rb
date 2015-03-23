require 'rails_helper'

describe 'the edit a question process' do
  it 'allows for the editing of title for a preexisting question' do
    question = FactoryGirl.create(:question)
    visit question_path(question)
    click_on 'Edit Question'
    fill_in "Title", :with => 'Javascript problems'
    click_on 'Update Question'
    expect(page).to have_content 'updated!'
  end
  
end
