class Resolvers::GetLatestArticles < GraphQL::Function

  argument :section_id, types.ID
  argument :limit, types.Int
  argument :page, types.Int

  # return type from the mutation
  type types[Types::ArticleType]

  # the mutation method
  # _obj - is parent object, which in this case is nil
  # _args - are the arguments passed
  # _ctx - is the GraphQL context (which would be discussed later)
  def call(_obj, args, _ctx)
    articles = Article.order(created_at: :desc)
    articles = articles.where(section_id: args['section_id']) if args['section_id']
    articles = articles.limit(args['limit']) if args['limit']
    articles = articles.page(args['page']) if args['page']
    return articles
  end
end
