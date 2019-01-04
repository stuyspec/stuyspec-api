class Resolvers::GetFeaturedArticle < GraphQL::Function

  # return type from the mutation
  type Types::ArticleType

  # the mutation method
   # _obj - is parent object, which in this case is nil
  # _args - are the arguments passed
  # _ctx - is the GraphQL context (which would be discussed later)
  def call(_obj, _args, _ctx)

    Article
      .order_by_rank # already JOINS on Section
      .where("sections.name != 'News'")
      .joins(:media)
      .first

  end
end
