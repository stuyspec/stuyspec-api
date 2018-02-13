Types::ArticleType = GraphQL::ObjectType.define do
  name "Article"
  
  field :id, !types.ID
  field :title, !types.String
  field :slug, !types.String
  field :content, !types.String
  field :created_at, types.String
  field :preview, types.String
  field :summary, types.String
  field :comments, types[!Types::CommentType]
  field :contributors, types[!Types::UserType]
  field :media, types[Types::MediumType]
  field :outquotes, types[Types::OutquoteType]
  field :issue, !types.Int
  field :rank, types.Int
  field :volume, !types.Int
  field :section, !Types::SectionType

  field :created_at, types.String do
    resolve -> (obj, args, ctx) {
      obj.created_at.strftime('%Y/%m/%d %H:%M:%S %z')
    }
  end
end