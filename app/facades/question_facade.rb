class QuestionFacade
  def self.get_questions(topic, question_number)
    json = QuestionService.create_trivia_questions(topic, question_number)
    return json if json.class == String
    json[:data].map do |data|
      Question.new(data)
    end
  end
end