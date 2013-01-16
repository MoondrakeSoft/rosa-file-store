class Api::ApplicationController < ActionController::API
  include AbstractController::Translation

  rescue_from Exception, :with => :render_500
  rescue_from ActiveRecord::RecordNotFound,
              ActionController::RoutingError,
              ActionController::UnknownController,
              AbstractController::ActionNotFound, :with => :render_404

  protected

  def render_404
    render_error 404
  end

  def render_500(e)
    render_error 500
  end

  def render_error(status)
    render json: {"Error #{status}:" => [t("#{status}_message")]}, status: status
  end
end
