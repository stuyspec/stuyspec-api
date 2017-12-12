class Resolvers::GetNewsArticles < GraphQL::Function

  # return type from the mutation
  type types[Types::ArticleType]

  # the mutation method
   # _obj - is parent object, which in this case is nil
  # _args - are the arguments passed
  # _ctx - is the GraphQL context (which would be discussed later)
  def call(_obj, _args, _ctx)
    primary_article =
      Article
        .joins('JOIN media ON articles.id = media.article_id')
        .joins('JOIN sections ON articles.section_id = sections.id')
        .where("sections.name = 'News'")
        .order("articles.rank + 3 * sections.rank + 12 * articles.issue"\
               " + 192 * articles.volume DESC")
        .first

    secondary_articles =
      Article
        .joins('JOIN sections ON articles.section_id = sections.id')
        .where("sections.name = 'News' AND articles.id != #{primary_article.id}")
        .order("articles.rank + 3 * sections.rank + 12 * articles.issue"\
               " + 192 * articles.volume DESC")

    if primary_article.nil?
      return secondary_articles.first(3)
    end
    return [primary_article, secondary_articles.first, secondary_articles.second]
  end
end
