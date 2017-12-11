Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :createArticle, function: Resolvers::CreateArticle.new
  field :createUser, function: Resolvers::CreateUser.new
  field :deleteArticle, function: Resolvers::DeleteArticle.new
  field :deleteSection, function: Resolvers::DeleteSection.new
end
