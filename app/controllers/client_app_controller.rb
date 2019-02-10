class ClientAppController < ActionController::Base
  def index
    article = Article.find_by(slug: params[:slug])
    @title = article&.title || "The Stuyvesant Spectator"
    @image = article&.media&.first&.attachment_url || "https://s3.amazonaws.com/stuyspec-images/the_logo.png"
    render template: "client_app/index", status: :ok
  end
end
