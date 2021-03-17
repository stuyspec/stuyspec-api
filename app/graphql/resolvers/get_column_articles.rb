class Resolvers::GetColumnArticles < Resolvers::ArticleQueryFunction

  # return type from the mutation
  type types[Types::ArticleType]

  # the mutation method
   # _obj - is parent object, which in this case is nil
  # _args - are the arguments passed
  # _ctx - is the GraphQL context (which would be discussed later)
  def call(_obj, _args, _ctx)
    main_left_column_articles = Article.order_by_rank.published.offset(6).first(3)
    left_column_articles = [*main_left_column_articles]
    right_column_articles = 
                            Article
                              .order_by_rank
                              .published
                              .offset(6)
                              .where.not(id: left_column_articles)
                              .first(2)
    return [*left_column_articles, *right_column_articles]
  end
end
 
