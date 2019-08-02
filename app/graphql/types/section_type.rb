Types::SectionType = GraphQL::ObjectType.define do
  name "Section"
  field :id, !types.ID
  field :name, !types.String
  field :slug, !types.String
  field :permalink, !types.String
  field :description, types.String
  field :rank, !types.Int
  field :parent_section, Types::SectionType
  field :subsections, types[Types::SectionType]
  field :articles, types[!Types::ArticleType] do 
    resolve -> (obj, args, ctx) {
      obj.articles.published
    }
  end

  field :unpublished_articles, types[!Types::ArticleType] do 
    resolve -> (obj, args, ctx) {
      if !Authentication::admin_is_valid(ctx)
        # Unpublished articles may only be viewed by authorized users.
        return GraphQL::ExecutionError.new("Invalid user token. Please log in.")
      end

      Authentication::generate_new_header(ctx)
      return obj.articles.unpublished
    }
  end

  field :parent_id, types.ID
end
