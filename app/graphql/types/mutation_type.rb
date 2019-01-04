Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :createArticle, function: Resolvers::CreateArticle.new
  field :createMedium, function: Resolvers::CreateMedium.new
  field :updateArticle, function: Resolvers::UpdateArticle.new
  field :createUser, function: Resolvers::CreateUser.new
  field :createSection, function: Resolvers::CreateSection.new
  field :deleteArticle, function: Resolvers::DeleteArticle.new
  field :deleteSection, function: Resolvers::DeleteSection.new
end
