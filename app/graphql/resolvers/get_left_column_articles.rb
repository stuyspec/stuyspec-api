class Resolvers::GetLeftColunmnArticles < GraphQL::Function

  # return type from the mutation
  types[Types::ArticleType]

  argument :outquotes_article_id, !types.ID

  # the mutation method
   # _obj - is parent object, which in this case is nil
  # _args - are the arguments passed
  # _ctx - is the GraphQL context (which would be discussed later)
  def call(_obj, _args, _ctx)
    main_articles = Article.offset(6).first(2)

    return main_articles.append(outquotes_article)
  end
end
 
