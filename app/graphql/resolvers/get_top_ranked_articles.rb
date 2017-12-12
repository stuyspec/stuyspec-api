class Resolvers::GetTopRankedArticles < GraphQL::Function

  # return type from the mutation
  type Types::ArticleType

  # the mutation method
   # _obj - is parent object, which in this case is nil
  # _args - are the arguments passed
  # _ctx - is the GraphQL context (which would be discussed later)
  def call(_obj, _args, _ctx)
    Article
      .order("articles.rank + 3 * sections.rank + 12 * articles.issue"\
             " + 192 * articles.volume DESC")
  end
end
