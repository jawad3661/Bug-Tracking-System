module RescueException
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  end

  private

  def record_not_found
    redirect_to root_path, notice: 'unknown Url'
  end
end
