class Resolvers::CreateArticle < Resolvers::MutationFunction
  
  # arguments passed as "args"
  argument :title, !types.String
  argument :section_id, !types.Int
  argument :content, !types.String
  argument :summary, types.String
  argument :created_at, types.String
  argument :outquotes, types[!types.String]
  argument :volume, !types.Int
  argument :issue, !types.Int
  argument :contributors, !types[!types.Int]
  argument :is_published, types.Boolean

  # return type from the mutation
  type Types::ArticleType

  # the mutation method
   # _obj - is parent object, which in this case is nil
  # args - are the arguments passed
  # _ctx - is the GraphQL context (which would be discussed later)
  def call(_obj, args, ctx)
    if !admin_is_valid(ctx)
      return GraphQL::ExecutionError.new("Invalid user token. Please log in.")
    end
    ActiveRecord::Base.transaction do
      @article = Article.new(
        title: args["title"],
        section_id: args["section_id"],
        content: args["content"],
        volume: args["volume"],
        issue: args["issue"],
        summary: args["summary"],
        created_at: args["created_at"],
        is_published: args["is_published"] || true
      )
      args["contributors"].each do |id|
        @article.authorships.build(user_id: id)

        # Adds contributor role to user if not yet present
        u = User.find_by(id: id)
        u.roles << Role.first unless u.nil? || u.roles.include?(Role.first)
      end
      if args["outquotes"]
        args["outquotes"].each do |text|
          @article.outquotes.build(text: text)
        end
      end
      generate_new_header(ctx) if @article.save
    end
    return @article
  end
end
