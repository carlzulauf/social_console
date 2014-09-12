class Credential < ActiveRecord::Base
  serialize :auth_data, JsonMarshaller.new
  belongs_to :user

  def display_name
    "#{provider}:#{uid} [#{id}]"
  end

  def inspect
    "#<Credential id: #{id}, user_id: #{user_id}, provider: #{provider}>"
  end

  def provider
    auth_data["provider"]
  end

  def uid
    auth_data["uid"]
  end

  def token
    auth_data["credentials"]["token"]
  end

  def secret
    auth_data["credentials"]["secret"]
  end

  def extract_auth_key
    "#{provider}:#{uid}"
  end

  def build_auth_key
    self.auth_key = extract_auth_key
  end

  def client
    case provider
    when "twitter"
      ::Twitter::REST::Client.new do |c|
        c.consumer_key        = SC_TWITTER["api_key"]
        c.consumer_secret     = SC_TWITTER["api_secret"]
        c.access_token        = token
        c.access_token_secret = secret
      end
    when "facebook"
      Koala::Facebook::API.new token
    end
  end

  def self.from_auth_data(auth_data)
    new(auth_data: auth_data) do |credential|
      credential.build_auth_key
    end
  end
end
