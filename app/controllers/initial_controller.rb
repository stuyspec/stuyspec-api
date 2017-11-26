class InitialController < ApplicationController
  def index
    render json: {
      :articles => Article.all,
      :sections => Section.all,
      :comments => Comment.all,
      :media => Medium.all,
      :users => User.all,
      :roles => Role.all,
      :user_roles => UserRole.all,
      :authorships => Authorship.all,
      :outquotes => Outquote.all
    }
  end
end
