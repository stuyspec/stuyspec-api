class Resolvers::UpdateArticle < Resolvers::MutationFunction
  # arguments passed as "args"
  argument :id, !types.ID
  argument :title, types.String
  argument :section_id, types.Int
  argument :content, types.String
  argument :summary, types.String
  argument :created_at, types.String
  argument :outquotes, types[!types.String]
  argument :volume, types.Int
  argument :issue, types.Int
  argument :contributors, types[!types.Int]
  argument :is_published, types.Boolean

  # return type from the mutation
  type Types::ArticleType

  # the mutation method
   # _obj - is parent object, which in this case is nil
  # args - are the arguments passed
  # _ctx - is the GraphQL context (which would be discussed later)
  def call(_obj, args, ctx)
    if !Authentication::admin_is_valid(ctx)
      return GraphQL::ExecutionError.new("Invalid user token. Please log in.")
    end
    @article = Article.find(args["id"])

    # Transaction so that we don't update a malformed article
    Article.transaction do
      @article.title = args["title"] if args["title"]
      @article.section_id = args["section_id"] if args["section_id"]
      @article.content = args["content"] if args["content"]
      @article.summary = args["summary"] if args["summary"]
      @article.created_at = args["created_at"] if args["created_at"]
      @article.volume = args["volume"] if args["volume"]
      @article.issue = args["issue"] if args["issue"]
      @article.is_published = args["is_published"] if args["is_published"]

      if args["outquotes"]
        @article.outquotes.clear
        args["outquotes"].each do |text|
          @article.outquotes.build(text: text)
        end
      end

      if args["contributors"]
        @article.contributors.clear
        args["contributors"].each do |id|
          Authorship.find_or_create_by(user_id: id, article_id: @article.id)

          # Adds contributor role to user if not yet present
          u = User.find_by(id: id)
          u.roles << Role.first unless u.nil? || u.roles.include?(Role.first)
        end
      end
      Authentication::generate_new_header(ctx) if @article.save
    end
    return @article
  end
end
