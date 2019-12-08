class Resolvers::GetFeaturedArticlesBySectionSlug < Resolvers::ArticleQueryFunction

  argument :section_slug, !types.String
  # return type from the mutation
  type types[Types::ArticleType]

  # the mutation method
   # _obj - is parent object, which in this case is nil
  # _args - are the arguments passed
  # _ctx - is the GraphQL context (which would be discussed later)
  def call(_obj, args, _ctx)
    @section = Section.find_by(slug: args['section_slug'])
    return GraphQL::ExecutionError.new("No such section found") if !@section

    @section_slugs = [args['section_slug']].concat(@section.subsections.map { |s| s.slug })

    primary_article =
      Article
        .joins('JOIN media ON articles.id = media.article_id')
        .joins('JOIN sections ON articles.section_id = sections.id')
        .where("sections.slug IN (?)", @section_slugs)
        .order("articles.rank + 3 * sections.rank + 12 * articles.issue"\
               " + 192 * articles.volume DESC")
        .published
        .first

    primary_article_id = if primary_article.nil? then -1 else primary_article.id end
    secondary_articles =
      Article
        .joins('JOIN sections ON articles.section_id = sections.id')
        .where("sections.slug IN (?) AND articles.id != ?", @section_slugs, primary_article_id)
        .order("articles.rank + 3 * sections.rank + 12 * articles.issue"\
               " + 192 * articles.volume DESC")
        .published

    if primary_article.nil?
      return secondary_articles.first(3)
    end
    return [primary_article, secondary_articles.first, secondary_articles.second]
  end
end
