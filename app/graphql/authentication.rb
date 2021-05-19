module Authentication
  def self.editor_is_valid(ctx)
    headers = Authentication::get_headers(ctx)
    user = Authentication::get_user(headers)
    
    client_id = headers['client']
    token = headers['access-token']

    return user && user.is_editor?(token, client_id)
  end

  def self.admin_is_valid(ctx)
      headers = Authentication::get_headers(ctx)
      user = Authentication::get_user(headers)
      
      client_id = headers['client']
      token = headers['access-token']
  
      return user && user.is_admin?(token, client_id)
    end
    
    def self.generate_new_header(ctx)
      # currently disable header change

      #headers = Authentication::get_headers(ctx)
      #user = Authentication::get_user(headers)
  
      #client_id = headers['client']
      #new_auth_header = user.create_new_auth_token(client_id)
      #response = ctx[:response]
      #response.headers.merge!(new_auth_header)
    end
  
    def self.get_headers(ctx)
      return ctx[:request].headers
    end
    
    def self.get_user(headers)
      uid = headers["uid"]
      return User.find_by(email: uid)
    end
  end