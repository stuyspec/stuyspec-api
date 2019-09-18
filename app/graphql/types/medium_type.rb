Types::MediumType = GraphQL::ObjectType.define do
  name "Medium"
  field :id, !types.ID
  field :created_at, !types.String
  field :profile, !Types::ProfileType
  field :user, !Types::UserType
  field :title, !types.String
  field :media_type, !types.String
  field :caption, types.String
  field :article, Types::ArticleType
  field :attachment_url, !types.String
  field :medium_attachment_url, !types.String
  field :thumb_attachment_url, !types.String
end

