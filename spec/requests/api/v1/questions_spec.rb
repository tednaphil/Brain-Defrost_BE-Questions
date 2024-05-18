require 'swagger_helper'

RSpec.describe 'api/v1/questions', type: :request do

  path '/api/v1/questions' do

    get('list questions') do
      tags 'Questions'
      produces 'application/json'

      parameter name: :params, in: :body, required: true, schema: {
        type: :object,
        properties: {
          topic: { type: :string, required: true },
          number_of_questions: { type: :integer, required: true }
        }
      }

      response(200, 'successful') do
        let(:params) { {
          topic: "sorcery",
          number_of_questions: 8,
        }}

        schema({
          type: :object,
          properties: {
            data: {
              type: :array,
              items: {
                type: :object,
                properties: {
                  id: { type: :string, required: true },
                  type: { type: :string, required: true },
                  attributes: {
                    type: :object,
                    properties: {
                      question_text: { type: :string },
                      question_number: { type: :integer },
                      answer: { type: :string },
                      options: {
                        type: :array,
                        items: { type: :string }
                      }
                    }
                  }
                }
              }
            }
          }
        })

        run_test! vcr: true do |example|
          expect(response).to have_http_status(200)

          parsed_data = JSON.parse(response.body, symbolize_names: true)
          expect(parsed_data[:data].size).to eq 8
        end
      end
    end
  end
end
