Types::MediumType = GraphQL::ObjectType.define do
  name "Medium"
  field :id, !types.ID
  field :created_at, !types.String
  field :profile, !Types::ProfileType
  field :user, !Types::UserType
  field :title, !types.String
  field :media_type do
    type !types.String
    description 'Currently supports "illustration" and "photo".'
  end
  field :is_featured do
    type !types.Boolean
    description 'Whether the medium will be shown at the top of its article.'
  end
  field :caption, types.String
  field :article, Types::ArticleType
  field :attachment_url, !types.String
  field :medium_attachment_url, !types.String
  field :thumb_attachment_url, !types.String
end

