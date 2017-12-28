class Resolvers::CreateSection < Resolvers::MutationFunction
  # arguments passed as "args"
  argument :name, !types.String
  argument :parent_id, types.Int
  argument :description, types.String
  argument :rank, !types.Int

  # return type from the mutation
  type Types::SectionType

  # the mutation method
   # _obj - is parent object, which in this case is nil
  # args - are the arguments passed
  # _ctx - is the GraphQL context (which would be discussed later)
  def call(_obj, args, ctx)
    if error = validate_user(ctx)
      return error
    end
    if args["parent_id"]
      parent_section = Section.find(args["parent_id"])
      section = parent_section.subsections.build(
        name: args["name"],
        description: args["description"],
        rank: args["rank"]
      )
      generate_new_header(ctx) if section.save
    else
      section = Section.create(
        name: args["name"],
        description: args["description"],
        rank: args["rank"]
      )
      generate_new_header(ctx) if section
    end
  end
end
