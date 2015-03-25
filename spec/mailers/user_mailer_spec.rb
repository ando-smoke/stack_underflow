require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "response_notification" do

    # 3.25.15: add FactoryGirl creation of a question object
    # to make below call to UserMailer.response_notification method pass
    # with required single arg (i.e. a question). AU
    let(:mail) {
      UserMailer.response_notification(FactoryGirl.create(:question))
    }

    it "renders the headers" do
      expect(mail.subject).to eq("New response received")
      expect(mail.to).to eq(["thatswhatshesaid@yomama.com"])
      expect(mail.from).to eq(["info-daemon@stackunderflow.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to include("You have received a new response")
    end
  end

end
