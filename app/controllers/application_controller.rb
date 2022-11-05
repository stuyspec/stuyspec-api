class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :cors_preflight_check

  def cors_preflight_check
    if request.method == 'OPTIONS'
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
      headers['Access-Control-Allow-Headers'] =
        'X-Requested-With, X-Prototype-Version, Token'
      headers['Access-Control-Max-Age'] = '1728000'
      render :text => '', :content_type => 'text/plain'
    end
  end

  def authenticate_admin!
    token = request.headers["access-token"]
    client_id = request.headers["client"]
    return render json: {
                    success: false,
                    errors: ["You do not have the relevant permissions"]
                  }, status: 401 unless current_user.is_admin?(token, client_id)
  end

  # rescue_from ActiveRecord::RecordNotFound do |exception|
  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: {
      success: false,
      errors: ["Record not found"]
    }, status: 404
  end

  # missing template
  rescue_from ActionView::MissingTemplate do |exception|
    Rails.logger.error exception "Missing template"
    render json: {
      success: false,
      errors: ["Missing template"]
    }, status: 404
  end

end