class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :cors_before_filter

  def cors_before_filter
    # Check that the `Origin` field matches our front-end client host
    headers['Access-Control-Allow-Origin'] = '*'
  end

end
