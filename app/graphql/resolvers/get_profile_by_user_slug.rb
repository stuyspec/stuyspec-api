class Resolvers::GetProfileByUserSlug < GraphQL::Function

  argument :user_slug, !types.String
  argument :role_slug, !types.String

  # return type from the mutation
  type Types::ProfileType

  # the mutation method
  # _obj - is parent object, which in this case is nil
  # args - are the arguments passed
  # _ctx - is the GraphQL context (which would be discussed later)
  def call(_obj, args, _ctx)
    return Profile
      .joins(:user, :role)
      .find_by(
        "users.slug = ? AND roles.slug = ?",
        args["user_slug"],
        args["role_slug"]
      )
  end
end
