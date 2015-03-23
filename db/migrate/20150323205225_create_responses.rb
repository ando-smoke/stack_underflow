class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.text :answer
      t.belongs_to :question
      
      t.timestamps null: false
    end
  end
end
