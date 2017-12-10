Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :createArticle, function: Resolvers::CreateArticle.new
  field :createUser, function: Resolvers::CreateUser.new
end
