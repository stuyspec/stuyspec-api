class Resolvers::MutationFunction < GraphQL::Function
  
  def validate_admin(ctx)
    set_headers(ctx)
    set_user(ctx)
    
    client_id = @headers['client']
    token = @headers['access-token']

    valid_admin = @user && @user.is_admin?(token, client_id)
    GraphQL::ExecutionError.new("Invalid user token. Please log in") unless valid_admin
  end
  
  def generate_new_header(ctx)
    set_headers(ctx)
    set_user(ctx)

    client_id = @headers['client']
    new_auth_header = @user.create_new_auth_token(client_id)
    response = ctx[:response]
    response.headers.merge!(new_auth_header)
  end

  private
  def set_headers(ctx)
    @headers = ctx[:request].headers
  end
  
  def set_user(ctx)
    uid = @headers["uid"]
    @user = User.find_by(email: uid)
  end
end
