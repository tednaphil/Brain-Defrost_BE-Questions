class Question
  attr_reader :question_number, 
              :question_text, 
              :answer, 
              :options,
              :id

  def initialize(data)
    @id = nil
    @question_number = data[:id]
    @question_text = data[:attributes][:question_text]
    @answer = data[:attributes][:correct_answer]
    @options = data[:attributes][:answer_options].shuffle
  end
end