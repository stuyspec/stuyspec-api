class Resolvers::GetTopRankedArticles < GraphQL::Function

  argument :section_id, types.ID
  argument :section_slug, types.String
  argument :has_media, types.Boolean
  # return type from the mutation
  type types[Types::ArticleType]

  # the mutation method
   # _obj - is parent object, which in this case is nil
  # _args - are the arguments passed
  # _ctx - is the GraphQL context (which would be discussed later)
  def call(_obj, args, _ctx)
    articles = Article.order_by_rank # joins Sections as well

    articles = articles.where(section_id: args["section_id"]) if args["section_id"]

    if args["section_slug"]
      section = Section.find_by(slug: args["section_slug"])
      if section.nil?
        return GraphQL::ExecutionError.new("Invalid section slug: #{args['section_slug']}")
      else
        articles = articles.where(section_id: section.id)
      end
    end

    if args["has_media"]
      unless articles.joins(:media).length == 0
        articles = articles.joins(:media)
      end
    end

    return articles
  end
end
