module Response
  extend ActiveSupport::Concern

  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def not_found
    json_response({ error: 'Invalid Access' }, 422)
  end

  def ok_response
    head(:ok)
  end

  def unauthorized
    json_response({ error: 'Un-Authorized' }, :unauthorized)
  end
end
