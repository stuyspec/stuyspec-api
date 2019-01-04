Types::UserType = GraphQL::ObjectType.define do
  name "User"
  field :id, !types.ID
  field :first_name, types.String
  field :last_name, types.String
  field :email, !types.String
  field :slug, !types.String
  field :description, types.String
  field :roles, types[Types::RoleType]
  field :profiles, types[Types::ProfileType]
  field :articles, types[Types::ArticleType]
  field :media, types[Types::MediumType]
  field :comments, types[Types::CommentType]
end
