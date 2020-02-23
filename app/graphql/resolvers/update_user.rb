class Resolvers::UpdateUser < Resolvers::MutationFunction
  # arguments passed as "args"
  argument :first_name, !types.String
  argument :last_name, types.String
  argument :email, types.String
  argument :profile_picture, as: :attatchment do
      type types.String
      description 'The base64 encoded bersion of the attatchment to upload.'
  end

  # return type from the mutation
  type Types::UserType

  # the mutation method
   # _obj - is parent object, which in this case is nil
  # args - are the arguments passed
  # _ctx - is the GraphQL context (which would be discussed later)
  def call(_obj, args, ctx)
    if !Authentication::editor_is_valid(ctx) or !Authentication::admin_is_valid(ctx)
      return GraphQL::ExecutionError.new("Invalid user token. Please log in.")
    end
    
    @user = Article.find(first_name: args["first_name"])

    # Transaction so that we don't update a malformed article
    User.transaction do
      media_type = args["media_type"]

      @user.first_name = args["first_name"] if args["first_name"]
      @user.last_name = args["last_name"] if args["last_name"]
      @user.email = args["email"] if args["email"]
      @user.profile_picture = args["profile_picture"] if args["profile_picture"]

      end

      Authentication::generate_new_header(ctx) if @user.save!
  end

    return @user
end
