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

    data_2 = {
      type: "trivia_question",
      id: "2",
      attributes: {
        question_text: "What is the most powerful piece in chess?", 
        correct_answer: "Queen", 
        answer_options: ["Queen", "King", "Knight", "Pawn"]
      }
    }

    @question = Question.new(data)
    @question_2 = Question.new(data_2)
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

    it "places the correct answer in a different location every time" do
      correct_index = @question.options.index("The Beatles")
      correct_index_2 = @question_2.options.index("Queen")
      
      expect(correct_index == correct_index_2).to be(false)
    end
  end
end