class Resolvers::GetFeaturedArticle < GraphQL::Function

  # return type from the mutation
  type Types::ArticleType

  # the mutation method
   # _obj - is parent object, which in this case is nil
  # _args - are the arguments passed
  # _ctx - is the GraphQL context (which would be discussed later)
  def call(_obj, _args, _ctx)
    Article
      .joins('JOIN media ON articles.id = media.article_id')
      .joins('JOIN sections ON articles.section_id = sections.id')
      .where("sections.name != 'News'")
      .first
  end
end
