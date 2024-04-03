# config/initializers/cors.rb

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    if Rails.env.development?
      origins 'http://localhost:3000'
      resource '*', headers: :any, methods: [:get, :post, :patch, :put]
    else
      origins 'https://viptechnologies.in'
      resource '*', headers: :any, methods: [:get, :post, :patch, :put]
    end
  end
end