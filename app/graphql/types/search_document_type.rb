Types::SearchDocumentType = GraphQL::ObjectType.define do
  name 'SearchDocument'
  field :id, !types.ID
  field :content, !types.String
  field :searchable_type, !types.String
  field :searchable, !Types::ArticleType
end
