class UserMailer < ApplicationMailer
  default from: "info-daemon@stackunderflow.com"

  def response_notification(question)
    @user = question.user
    @question = question
    @greeting = "You have received a new response for " +
      "the question '" + question.title + "'."

    mail to: @user.email, subject: "New response received"
  end
end
