class Api::V1::BaseController < ActionController::Base
  skip_before_action :verify_authenticity_token

  include Response

  require "#{Rails.root}/lib/json_web_token.rb"

  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header

    begin
      @decoded = JsonWebToken.decode(header)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      unauthorized
    rescue JWT::DecodeError => e
      unauthorized
    end
  end
end
