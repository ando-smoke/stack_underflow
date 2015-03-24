class Question < ActiveRecord::Base
  has_many :responses, dependent: :destroy
  belongs_to :user
  validates :title, presence: true
  validates :content, presence: true
end
