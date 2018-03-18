class Resolvers::MutationFunction < GraphQL::Function
  
  def admin_is_valid(ctx)
    set_headers(ctx)
    set_user(ctx)
    
    client_id = @headers['client']
    token = @headers['access-token']

    return @user && @user.is_admin?(token, client_id)
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
    puts uid
    @user = User.find_by(email: uid)
  end
end
