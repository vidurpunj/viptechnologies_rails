# config/initializers/cors.rb

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    if Rails.env.development?
      origins 'http://localhost:3005'
      resource '*', headers: :any, methods: [:get, :post, :patch, :put]
    else
      origins 'https://your-production-domain.com'
    end
  end
end