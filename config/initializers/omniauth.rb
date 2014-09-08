config = YAML.load_file Rails.root.join("config", "omniauth.yml")
providers = config.try(:[], "providers") || {}

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  if twitter = providers["twitter"]
    provider :twitter, twitter["api_key"], twitter["api_secret"]
  end
end
