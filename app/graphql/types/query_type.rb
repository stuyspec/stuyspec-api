Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  field :allArticles, !types[Types::ArticleType] do
    # resolve would be called in order to fetch data for that field
    resolve -> (obj, args, ctx) { Article.all }
  end

  field :articleByID do
    type Types::ArticleType
    argument :id, !types.ID
    description "Find an article by ID"
    resolve ->(obj, args, ctx) { Article.find(args["id"])}
  end

  field :allUsers, !types[Types::UserType] do
    # resolve would be called in order to fetch data for that field
    resolve -> (obj, args, ctx) { User.all }
  end

  field :userByID do
    type Types::UserType
    argument :id, !types.ID
    description "Find an user by ID"
    resolve ->(obj, args, ctx) { User.find(args["id"])}
  end

  field :userByEmail do
    type Types::UserType
    argument :email, !types.String
    description "Find an user by email"
    resolve ->(obj, args, ctx) { User.find_by(email: args["email"])}
  end

  field :allMedia, !types[Types::MediumType] do
    # resolve would be called in order to fetch data for that field
    resolve -> (obj, args, ctx) { Medium.all }
  end

  field :latestArticles do
    type !types[Types::ArticleType]
    argument :limit, !types.Int
    description "Get the n latest articles"
    resolve -> (obj, args, ctx) {
      Article.order(created_at: :desc).limit(args["limit"])
    }
  end

  field :featuredArticle, function: Resolvers::GetFeaturedArticle.new
end
