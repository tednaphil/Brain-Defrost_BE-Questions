require 'rails_helper'

RSpec.describe QuestionFacade do
  describe '.get_questions(topic, question_number)' do
    let!(:question_number) { 3 }
    let!(:topic) { "music"}

    it "returns question objects in an array", :vcr do
      questions = QuestionFacade.get_questions(topic, question_number)

      expect(questions).to be_an(Array)
      questions.each { |question| expect(question).to be_a(Question) }
    end

    it "returns an error message when service returns any error" do
      stub_request(:post, 'https://api.openai.com/v1/chat/completions')
        .to_return(status: 500)

      questions = QuestionFacade.get_questions(topic, question_number)
      expect(questions).to eq("Unable to create trivia questions at this time")
    end
  end
end