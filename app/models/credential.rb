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

  def extract_auth_key
    "#{provider}:#{uid}"
  end

  def build_auth_key
    self.auth_key = extract_auth_key
  end

  def self.from_auth_data(auth_data)
    new(auth_data: auth_data) do |credential|
      credential.build_auth_key
    end
  end
end
