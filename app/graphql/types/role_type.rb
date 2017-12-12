Types::RoleType = GraphQL::ObjectType.define do
  name "Role"
  field :id, !types.ID
  field :title, !types.String
  field :slug, !types.String
end
