class Resolvers::GetProfileByUserSlug < GraphQL::Function

  argument :slug, !types.String
  argument :role, !types.String

  # return type from the mutation
  type Types::ProfileType

  # the mutation method
  # _obj - is parent object, which in this case is nil
  # args - are the arguments passed
  # _ctx - is the GraphQL context (which would be discussed later)
  def call(_obj, args, _ctx)
    return Profile.joins(:user).joins(:role).where("users.slug = ? AND roles.title = ?", args["slug"], args["role"]).first
  end
end
