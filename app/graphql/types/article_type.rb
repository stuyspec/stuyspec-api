Types::ArticleType = GraphQL::ObjectType.define do
  name "Article"
  
  field :id, !types.ID
  field :title, !types.String
  field :slug, !types.String
  field :content, !types.String
  field :preview, types.String
  field :volume, !types.Int
  field :issue, !types.Int
  field :rank, types.Int
  field :section, !Types::SectionType
  field :comments, types[!Types::CommentType]
  field :contributors, types[!Types::UserType]
  field :media, types[!Types::MediumType]
  field :outquotes, types[Types::OutquoteType]

  # We want media shown in the order they were uploaded, which is by
  # reverse id.
  # field :media, types[!Types::MediumType] do
  #   resolve -> (obj, args, ctx) {
  #     obj.media.reverse
  #   }
  # end

  field :published_comments, types[!Types::CommentType] do
    resolve -> (obj, args, ctx) {
      obj.comments.where.not(published_at: nil)
    }
  end

  # created_at must be in this specific format for it to be readable, as a
  # timestamp, across all browsers.
  field :created_at, types.String do
    resolve -> (obj, args, ctx) {
      obj.created_at.strftime('%Y/%m/%d %H:%M:%S %z')
    }
  end
end