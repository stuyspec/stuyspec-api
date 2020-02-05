class Resolvers::GetTopRankedArticles < Resolvers::ArticleQueryFunction

  argument :section_id, types.ID
  argument :section_slug, types.String
  argument :has_media, types.Boolean
  argument :limit, types.Int
  argument :include_subsections, types.Boolean
  # return type from the mutation
  type types[Types::ArticleType]

  # the mutation method
   # _obj - is parent object, which in this case is nil
  # _args - are the arguments passed
  # _ctx - is the GraphQL context (which would be discussed later)
  def call(_obj, args, _ctx)
    articles = Article.order_by_rank.published # joins Sections as well

    if args['section_id'] || args['section_slug']
      if args['section_id']
        section = Section.find(args['section_id'])
      else
        section = Section.find_by(slug: args['section_slug'])
      end

      return GraphQL::ExecutionError.new("Invalid section id or slug") if section.nil?

      if args['include_subsections']
        section_ids = section.subsections.map do |s| s.id end
        section_ids << section.id
      else
        section_ids = section.id
      end

      articles = articles.where(section_id: section_ids)
    end

    if args["has_media"]
      unless articles.joins(:media).length == 0
        # uses SQL GROUP_BY clause to remove repeated articles from media JOIN
        articles = articles.joins(:media).group('articles.id, sections.rank')        
      end
    end

    articles = articles.limit(args["limit"]) if args["limit"]

    return articles
  end
end
