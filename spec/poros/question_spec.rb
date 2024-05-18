require 'rails_helper'

RSpec.describe Question do
  before do
    data = {
      type: "trivia_question",
      id: "1",
      attributes: {
        question_text: "Which band released the album 'Abbey Road'?", 
        correct_answer: "The Beatles", 
        answer_options: ["The Beatles", "Led Zeppelin", "Queen", "Pink Floyd"]
      }
    }

    @question = Question.new(data)
  end

  describe '#initialize' do
    it "creates a Question object from parsed JSON data" do
      expect(@question).to be_a(Question)
    end

    it "populates attributes correctly" do
      expect(@question.question_number).to eq("1")
      expect(@question.question_text).to eq("Which band released the album 'Abbey Road'?")
      expect(@question.answer).to eq("The Beatles")
      expect(@question.options).to be_an(Array)
    end
  end
end