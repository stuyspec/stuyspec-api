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
      :articles => Article.all,
      :sections => Section.all,
      :comments => Comment.all,
      :media => media_with_urls,
      :users => User.all,
      :roles => Role.all,
      :user_roles => UserRole.all,
      :authorships => Authorship.all,
      :outquotes => Outquote.all,
      :tags => Tag.all,
    }
  end
end
