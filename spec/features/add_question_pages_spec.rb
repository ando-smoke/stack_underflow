require 'rails_helper'

describe 'the add a question process' do
  it "adds a new question" do
    current_user = FactoryGirl.create(:user)
    sign_in(current_user)
    click_on "Add Question?"
    fill_in 'Title', :with => 'Yer mom'
    fill_in 'Content', :with => 'knows no Ruby, fool!'
    click_on "Create Question"
    expect(page).to have_content "successfully"
  end

  it "errors when the title field is left blank" do
    current_user = FactoryGirl.create(:user)
    sign_in(current_user)
    click_on "Add Question?"
    fill_in 'Content', :with => "what the???"
    click_on 'Create Question'
    expect(page).to have_content 'Whoops!'
  end
end
