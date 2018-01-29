Types::ProfileType = GraphQL::ObjectType.define do
  name "Profile"
  field :id, !types.ID
  field :role, !Types::RoleType
  field :user, !Types::UserType
  field :media, !types[Types::MediumType]
end
