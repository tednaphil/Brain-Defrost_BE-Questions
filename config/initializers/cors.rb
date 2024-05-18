# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin Ajax requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "http://localhost:3000", "http://127.0.0.1:3000", "https://dashboard.heroku.com/apps/brain-defrost", "http://localhost:5000", "http://127.0.0.1:5000", "https://brain-defrost-f8afea5ead0a.herokuapp.com/"

    resource "*",
      headers: :any,
      methods: [:post, :options, :head]
  end
end
