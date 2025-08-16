PEXELS_CLIENT = Pexels::Client.new(
  PEXELS_CLIENT = Pexels::Client.new(Rails.application.credentials.pexels[:api_key])
)
