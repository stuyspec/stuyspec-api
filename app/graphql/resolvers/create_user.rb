class Resolvers::CreateUser < GraphQL::Function

  argument :first_name, !types.String
  argument :last_name, !types.String
  argument :email, !types.String
  argument :password, !types.String
  argument :password_confirmation, !types.String

  type Types::UserType

  def call(_obj, args, _ctx)
    User.create!(
      first_name: args[:first_name],
      last_name: args[:last_name],
      email: args[:email],
      password: args[:password],
      password_confirmation: args[:password_confirmation],
      created_at: Time.now
    )
  end
  
end
