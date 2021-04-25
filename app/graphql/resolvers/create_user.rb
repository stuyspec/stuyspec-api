class Resolvers::CreateUser < Resolvers::MutationFunction

  argument :first_name, !types.String
  argument :last_name, !types.String
  argument :email, !types.String
  argument :description, !types.String
  argument :password, !types.String
  argument :password_confirmation, !types.String
  argument :role, !types.String
  argument :profile_picture_b64, as: :attachment do
      type types.String
      description 'The base64 encoded version of the profile picture.'
  end

  type Types::UserType

  def call(_obj, args, ctx)    
    if !Authentication::admin_is_valid(ctx)
      return GraphQL::ExecutionError.new("Invalid user token. Please log in.")
    end

    email_user = User.find_by(email: args["email"])
    if !email_user.nil?
      return GraphQL::ExecutionError.new(
        "Email taken by %s %s." % [email_user.first_name, email_user.last_name]
      )
    end
    
    @new_user = User.new(
      first_name: args[:first_name],
      last_name: args[:last_name],
      email: args[:email],
      description: args[:description],
      password: args[:password],
      password_confirmation: args[:password_confirmation],
      created_at: Time.now,
      profile_picture: args["attachment"] || nil,
    )
    role = Role.find_by(title: args["role"])
    if args["role"] and role != nil and !@new_user.roles.include?(role)
      @new_user.roles << role
    end
    Authentication::generate_new_header(ctx) if @new_user.save!
    return @new_user
  end

end
