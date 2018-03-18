class Resolvers::CreateUser < Resolvers::MutationFunction

  argument :first_name, !types.String
  argument :last_name, !types.String
  argument :email, !types.String
  argument :password, !types.String
  argument :password_confirmation, !types.String

  type Types::UserType

  def call(_obj, args, ctx)    
    if !admin_is_valid(ctx)
      return GraphQL::ExecutionError.new("Invalid user token. Please log in.")
    end

    emailUser = User.find_by(email: args["email"])
    if !emailUser.nil?
      return GraphQL::ExecutionError.new(
        "Email taken by %s %s." % [emailUser.first_name, emailUser.last_name]
      )
    end

    @new_user = User.new(
      first_name: args[:first_name],
      last_name: args[:last_name],
      email: args[:email],
      password: args[:password],
      password_confirmation: args[:password_confirmation],
      created_at: Time.now
    )
    generate_new_header(ctx) if @new_user.save!
    return @new_user
  end
  
end
