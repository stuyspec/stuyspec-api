class Resolvers::CreateMedium < Resolvers::MutationFunction

  # arguments passed as "args"
  argument :title, types.String
  argument :article_id, !types.Int
  argument :user_id, !types.Int
  argument :caption, types.String
  argument :media_type, !types.String
  argument :attachment_b64, as: :attachment do
    type !types.String
    description 'The base64 encoded version of the attachment to upload.'
  end

  # return type from the mutation
  type Types::MediumType

  # the mutation method
  # _obj - is parent object, which in this case is nil
  # args - are the arguments passed
  # _ctx - is the GraphQL context (which would be discussed later)
  def call(_obj, args, ctx)
    if !admin_is_valid(ctx)
      return GraphQL::ExecutionError.new("Invalid user token. Please log in.")
    end

    media_type = args["media_type"]
    if media_type != "illustration" && media_type != "photo"
      return GraphQL::ExecutionError.new(
        "#{media_type} is currently unsupported"
      )
    end

    if media_type == "illustration"
      roleTitle = "Illustrator"
    else      
      roleTitle = "Photographer"
    end
    role = Role.find_by(title: roleTitle)

    profile = Profile.find_by(role_id: role.id, user_id: args["user_id"])
    if profile.nil?
      profile = Profile.create(role_id: role.id, user_id: args["user_id"])
    end

    @medium = Medium.new(
      title: args["title"],
      article_id: args["article_id"],
      profile_id: profile.id,
      caption: args["caption"],
      media_type: args["media_type"],
      attachment: args["attachment"],
    )
    generate_new_header(ctx) if @medium.save!
    return @medium
  end
end
