Types::SectionType = GraphQL::ObjectType.define do
  name "Section"
  field :name, !types.String
  field :slug, !types.String
  field :description, types.String
  field :rank, !types.Int
  field :parent_section, Types::SectionType
end
