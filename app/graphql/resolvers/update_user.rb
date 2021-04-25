class Resolvers::UpdateUser < Resolvers::MutationFunction
  # arguments passed as "args"
  argument :id, !types.ID
  argument :first_name, types.String
  argument :last_name, types.String
  argument :email, types.String
  argument :description, types.String
  argument :role, types.String
  argument :profile_picture_b64, as: :attachment do
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
    
    @user = User.find(args["id"])

    # Transaction so that we don't update a malformed user
    User.transaction do
      @user.first_name = args["first_name"] if args["first_name"]
      @user.last_name = args["last_name"] if args["last_name"]
      @user.email = args["email"] if args["email"]
      @user.description = args["description"] if args["description"]      
      @user.profile_picture = args["attachment"] if args["attachment"]
      if args["first_name"] or args["last_name"]
        save = "-" + @user.slug.split("-")[-1]
        save = "" if save =~ /\d/ else save
        @user.slug = args["first_name"].downcase + "-" + args["last_name"].downcase + save
      end
      role = Role.find_by(title: args["role"])
      if args["role"] and role != nil and !@user.roles.include?(role)
        @user.roles << role
      end
      Authentication::generate_new_header(ctx) if @user.save!
    end
    return @user
  end
end
