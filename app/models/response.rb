class Response < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  validates :answer, presence: true
end
