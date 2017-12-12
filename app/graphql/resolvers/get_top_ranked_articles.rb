class Resolvers::GetTopRankedArticles < GraphQL::Function

  argument :section_id, !types.ID
  argument :limit, types.Int
  # return type from the mutation
  type Types::ArticleType

  # the mutation method
   # _obj - is parent object, which in this case is nil
  # _args - are the arguments passed
  # _ctx - is the GraphQL context (which would be discussed later)
  def call(_obj, _args, _ctx)
    articles = Article
      .order("articles.rank + 3 * sections.rank + 12 * articles.issue"\
             " + 192 * articles.volume DESC")
      .where(section_id: args["section_id"])
    articles = articles.limit(args["limit"]) if args["limit"]
    return articles
  end
end
