class Resolvers::GetColumnArticles < Resolvers::ArticleQueryFunction

  # return type from the mutation
  type types[Types::ArticleType]

  # the mutation method
   # _obj - is parent object, which in this case is nil
  # _args - are the arguments passed
  # _ctx - is the GraphQL context (which would be discussed later)
  def call(_obj, _args, _ctx)
    main_left_column_articles = select_published(Article.order_by_rank.offset(6)).first(2)
    outquotes_article = select_published(
                        Article
                          .order_by_rank
                          .offset(6)
                          .joins(:outquotes)
                          .where.not(id: main_left_column_articles)
    ).first
    left_column_articles = [*main_left_column_articles, outquotes_article]
    right_column_articles = select_published(
                            Article
                              .order_by_rank
                              .offset(6)
                              .where.not(id: left_column_articles)
    ).first(2)
    return [*left_column_articles, *right_column_articles]
  end
end
 
