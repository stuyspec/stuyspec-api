Types::UserType = GraphQL::ObjectType.define do
  name "User"
  field :id, !types.ID
  field :first_name, types.String
  field :last_name, types.String
  field :email, !types.String
  field :slug, !types.String
  field :description, types.String
  field :profile_url, types.String
  field :roles, types[Types::RoleType]
  field :profiles, types[Types::ProfileType]
  field :articles, types[!Types::ArticleType] do 
    resolve -> (obj, args, ctx) {
      obj.articles.published
    }
  end

  field :unpublished_articles, types[!Types::ArticleType] do 
    resolve -> (obj, args, ctx) {
      if !Authentication::admin_is_valid(ctx)
        # Unpublished articles may only be viewed by authorized users.
        return GraphQL::ExecutionError.new("Invalid user token. Please log in.")
      end

      Authentication::generate_new_header(ctx)
      return obj.articles.unpublished
    }
  end

  field :media, types[Types::MediumType]
  field :comments, types[Types::CommentType]
end
