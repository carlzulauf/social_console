class User < ActiveRecord::Base
  has_many :credentials

  def display_name
    "#{auth_key} [#{id}]"
  end

  def add_credential(credential)
    if credentials.where(auth_key: credential.auth_key).none?
      credentials << credential
    end
  end
end
