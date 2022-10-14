class JsonWebToken
  SECRET_KEY = Rails.application.secrets.secret_key_base. to_s

  def self.encode(payload)
    payload[:exp] = payload[:exp].to_i
    JWT.encode(payload, SECRET_KEY)
  end

  def self.decode(token)
    return JWT.decode(token, SECRET_KEY)[0]
  end
end
