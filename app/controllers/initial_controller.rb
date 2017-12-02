class InitialController < ApplicationController
  def index
    media_with_urls = Medium.all.map do |medium|
      medium.attributes.merge({
                                attachment_url: medium.attachment_url,
                                medium_attachment_url: medium.medium_attachment_url,
                                thumb_attachment_url: medium.thumb_attachment_url
                              })
    end
    render json: {
      :articles => Article
                     .joins("LEFT JOIN sections ON articles.section_id = sections.id")
                     .order("articles.rank + 3 * sections.rank + 12 * articles.issue + 192 * articles.volume DESC"),
      :sections => Section.where("is_visible = true"),
      :comments => Comment.where.not(published_at: nil).all,
      :media => media_with_urls,
      :users => User.all,
      :roles => Role.all,
      :user_roles => UserRole.all,
      :authorships => Authorship.all,
      :outquotes => Outquote.all
    }
  end
end
