class Api::V1::QuestionsController < ApplicationController
  def create
    questions = QuestionFacade.create_questions(params[:topic], params[:number_of_questions])
    if questions.class == String
      render json: { error: { message: questions} }, status: :internal_server_error
    else
      render json: QuestionSerializer.new(questions)
    end
  end
end
