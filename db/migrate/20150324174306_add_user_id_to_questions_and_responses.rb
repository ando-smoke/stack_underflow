class AddUserIdToQuestionsAndResponses < ActiveRecord::Migration
  def change
    add_column :questions, :user_id, :integer
    add_column :responses, :user_id, :integer

    add_foreign_key :questions, :users
    add_foreign_key :responses, :users

    add_foreign_key :responses, :questions
  end
end
