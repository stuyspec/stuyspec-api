Types::CommentType = GraphQL::ObjectType.define do
  name "Comment"
  field :id, !types.ID
  field :content, !types.String
  field :created_at, !types.String
  field :published_at, types.String
  field :user, !Types::UserType
end
