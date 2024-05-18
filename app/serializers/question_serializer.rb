class QuestionSerializer
  include JSONAPI::Serializer
  attributes :question_text, :question_number, :answer, :options
end