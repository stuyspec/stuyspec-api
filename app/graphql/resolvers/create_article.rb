class Resolvers::CreateArticle < Resolvers::MutationFunction
  # arguments passed as "args"
  argument :title, !types.String
  argument :section_id, !types.Int
  argument :content, !types.String
  argument :summary, types.String
  argument :created_at, types.String
  argument :outquotes, types[types.String]
  argument :volume, types.Int
  argument :issue, types.Int
  argument :contributors, !types[types.Int]

  # return type from the mutation
  type Types::ArticleType

  # the mutation method
   # _obj - is parent object, which in this case is nil
  # args - are the arguments passed
  # _ctx - is the GraphQL context (which would be discussed later)
  def call(_obj, args, ctx)
    if !validate_admin(ctx)
      return GraphQL::ExecutionError.new("Invalid user token. Please log in")
    end
    @article = Article.new(
      title: args["title"],
      section_id: args["section_id"],
      content: args["content"],
      volume: args["volume"],
      issue: args["issue"],
      summary: args["summary"],
      created_at: args["created_at"],
    )
    args["contributors"].each do |id|
      @article.authorships.build(user_id: id)
    end
    if args["outquotes"]
      args["outquotes"].each do |text|
        @article.outquotes.build(text: text)
      end
    end
    generate_new_header(ctx) if @article.save
    return @article
  end
end
