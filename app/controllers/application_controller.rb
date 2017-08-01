class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :cors_before_filter

  def cors_before_filter
    # Check that the `Origin` field matches our front-end client host
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] =  'POST, GET, OPTIONS, DELETE'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end

end
