class Resolvers::CreateUser < GraphQL::Function
  AuthProviderInput = GraphQL::InputObjectType.define do
    name 'AuthProviderSignupData'

    argument :email, Types::AuthProviderEmailInput
  end

  argument :first_name, !types.String
  argument :last_name, !types.String
  argument :auth_provider, !AuthProviderInput

  type Types::UserType

  def call(_obj, args, _ctx)
    User.create!(
      first_name: args[:first_name],
      last_name: args[:last_name],
      email: args[:auth_provider][:email][:email],
      password: args[:auth_provider][:email][:password],
      password_confirmation: args[:auth_provider][:email][:password_confirmation],
      created_at: Time.now
    )
  end
  
end
