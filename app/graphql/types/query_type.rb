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
end
