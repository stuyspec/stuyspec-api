Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  field :allArticles, !types[Types::ArticleType] do
    resolve -> (obj, args, ctx) { Article.all }
  end

  field :allSections, !types[Types::SectionType] do
    resolve -> (obj, args, ctx) { Section.all }
  end

  field :allUsers, !types[Types::UserType] do
    resolve -> (obj, args, ctx) { User.all }
  end

  field :allMedia, !types[Types::MediumType] do
    resolve -> (obj, args, ctx) { Medium.all }
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
      PgSearch.multisearch(args["query"])
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
    resolve -> (obj, args, ctx) { Section.where(parent_id: nil)}
  end

  field :featuredArticlesBySectionSlug, function: Resolvers::GetFeaturedArticlesBySectionSlug.new

  field :featuredArticle, function: Resolvers::GetFeaturedArticle.new

  field :columnArticles, function: Resolvers::GetColumnArticles.new

  field :profileByUserAndRole, function: Resolvers::GetProfileByUserAndRole.new
end
