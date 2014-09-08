config = YAML.load_file Rails.root.join("config", "omniauth.yml")
providers = config.try(:[], "providers") || {}
SC_TWITTER = providers["twitter"]

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  if SC_TWITTER
    provider :twitter, SC_TWITTER["api_key"], SC_TWITTER["api_secret"]
  end
end
