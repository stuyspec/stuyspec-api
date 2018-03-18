class Resolvers::DeleteSection < Resolvers::MutationFunction
  # arguments passed as "args"
  argument :id, !types.ID

  # return type from the mutation
  type Types::SectionType

  # the mutation method
   # _obj - is parent object, which in this case is nil
  # args - are the arguments passed
  # _ctx - is the GraphQL context (which would be discussed later)
  def call(_obj, args, ctx)
    if !validate_admin(ctx)
      return GraphQL::ExecutionError.new("Invalid user token. Please log in")
    end
    section = Section.find(args["id"]).destroy!
    generate_new_header(ctx) if section
    return section
  end
end
