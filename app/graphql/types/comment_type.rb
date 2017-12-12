Types::CommentType = GraphQL::ObjectType.define do
  name "Comment"
  field :id, !types.ID
  field :content, !types.String
  field :created_at, !types.String
end
