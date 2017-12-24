class Resolvers::UpdateArticle < GraphQL::Function
  # arguments passed as "args"
  argument :id, !types.ID
  argument :title, types.String
  argument :section_id, types.Int
  argument :content, types.String
  argument :volume, types.Int
  argument :issue, types.Int
  argument :contributors, types[types.Int]

  # return type from the mutation
  type Types::ArticleType

  # the mutation method
   # _obj - is parent object, which in this case is nil
  # args - are the arguments passed
  # _ctx - is the GraphQL context (which would be discussed later)
  def call(_obj, args, _ctx)
    @article = Article.find(args["id"])

    # Transaction so that we don't update a malformed article
    Article.transaction do
      @article.title = args["title"] if args["title"]
      @article.section_id = args["section_id"] if args["section_id"]
      @article.content = args["content"] if args["content"]
      @article.volume = args["volume"] if args["volume"]
      @article.issue = args["issue"] if args["issue"]

      if args["contributors"]
        args["contributors"].each do |id|
          Authorship.find_or_create_by(user_id: id, article_id: @article.id)
        end
      end
      @article.save
    end
    return @article
  end
end
