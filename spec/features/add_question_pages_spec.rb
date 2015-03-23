require 'rails_helper'

describe 'the add a question process' do
  it "adds a new question" do
    visit root_path
    click_on "Add New Question"
    fill_in 'Title', :with => 'Yer mom'
    fill_in 'Content', :with => 'knows no Ruby, fool!'
    click_on "Create Question"
    expect(page).to have_content "successfully"
  end

  it "errors when the title field is left blank" do
    visit new_question_path
    fill_in 'Content', :with => "what the???"
    click_on 'Create Question'
    expect(page).to have_content 'Whoops!'
  end
end
