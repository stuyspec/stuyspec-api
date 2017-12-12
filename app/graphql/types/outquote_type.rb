Types::OutquoteType = GraphQL::ObjectType.define do
  name "Outquote"
  field :id, !types.ID
  field :text, !types.String
  field :article, !Types::ArticleType
end
