class Resolvers::GetFeaturedSubsection < GraphQL::Function

  argument :section_id, !types.ID
  # return type from the mutation
  type Types::SectionType

  # the mutation method
   # _obj - is parent object, which in this case is nil
  # _args - are the arguments passed
  # _ctx - is the GraphQL context (which would be discussed later)
  def call(_obj, args, _ctx)
    section = Section.find(args['section_id'])
    if section.slug == '10-31-terror-attack'
      return Section.find_by(slug: 'creative-responses')
    elsif section.slug == 'news'
      return Section.find_by(slug: 'black-lives-matter')
    elsif section.slug == 'ae'
      return Section.find_by(slug: 'music')
    end
    subsections = Section.where(parent_id: section.id)
    return subsections[0]
  end
end
