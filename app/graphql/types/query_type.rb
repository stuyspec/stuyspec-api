Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  field :allSections, !types[Types::SectionType] do
    resolve -> (obj, args, ctx) { Section.all }
  end

  field :articlesBySectionID do
    type !types[Types::ArticleType]
    argument :section_id, !types.ID
    resolve -> (obj, args, ctx) {
      Resolvers::ArticleQueryFunction(Article.where(section_id: args["section_id"]))
    }
  end

  field :articleByContent do
    type Types::ArticleType
    argument :content, !types.String
    resolve -> (obj, args, ctx) {
      article = Article.find_by("content like ?", "%#{args['content']}%")
      if article.nil?
        return GraphQL::ExecutionError.new("No article found.")
      end
      return article
    }
  end

  field :sectionsByParentSectionID do
    type !types[Types::SectionType]
    argument :section_id, !types.ID
    resolve -> (obj, args, ctx) {
      Section.where(parent_id: args["section_id"])
    }
  end

  field :searchArticles do
    type !types[Types::SearchDocumentType]
    argument :query, !types.String
    resolve -> (obj, args, ctx) {
      results = PgSearch.multisearch(args["query"])
      results.select{ |r| !r.nil? || r.searchable.is_published }
    }
  end
  
  field :articleByID do
    type Types::ArticleType
    argument :id, !types.ID
    description "Find an article by ID"
    resolve -> (obj, args, ctx) { Article.find(args["id"]) }
  end

  field :articleBySlug do
    type Types::ArticleType
    argument :slug, !types.String
    description "Find an article by slug"
    resolve ->(obj, args, ctx) { Article.friendly.find(args["slug"])}
  end

  field :userByUID do
    type Types::UserType
    argument :uid, !types.String
    description "Find user by UID"
    resolve -> (obj, args, ctx) { User.find_by(uid: args["uid"]) }
  end
  
  field :userBySlug do
    type Types::UserType
    argument :slug, !types.String
    description "Find an user by slug"
    resolve ->(obj, args, ctx) { User.find_by(slug: args["slug"])}
  end

  field :userByFirstLastName do
    type Types::UserType
    argument :first_name, !types.String
    argument :last_name, !types.String
    description "Find user by first and last names"
    resolve -> (obj, args, ctx) {
      User.find_by(first_name: args["first_name"], last_name: args["last_name"])
    }
  end

field :allUsersWithRoles, !types[Types::UserType] do
    resolve -> (obj, args, ctx) { User.all.select do |user| user.roles.any? end }
  end

  field :latestArticles, function: Resolvers::GetLatestArticles.new

  field :sectionBySlug do
    type Types::SectionType
    argument :slug, !types.String
    description "Find an section by slug"
    resolve ->(obj, args, ctx) { Section.friendly.find(args["slug"])}
  end

  field :featuredSubsection, function: Resolvers::GetFeaturedSubsection.new
  
  field :topRankedArticles, function: Resolvers::GetTopRankedArticles.new

  field :featuredSections, !types[Types::SectionType] do
    resolve -> (obj, args, ctx) { Section.where(parent_id: nil).order("rank DESC") }
  end

  field :featuredArticlesBySectionSlug, function: Resolvers::GetFeaturedArticlesBySectionSlug.new

  field :featuredArticle, function: Resolvers::GetFeaturedArticle.new

  field :columnArticles, function: Resolvers::GetColumnArticles.new

  field :profileByUserAndRole, function: Resolvers::GetProfileByUserAndRole.new
end
