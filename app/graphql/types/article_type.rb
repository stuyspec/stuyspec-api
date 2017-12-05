Types::ArticleType = GraphQL::ObjectType.define do
  name "Article"
  field :id, !types.ID
  field :title, !types.String
  field :content, !types.String
  field :comments, types[!Types::CommentType]
  field :contributors, types[!Types::UserType]
  field :media, types[Types::MediumType]
end
