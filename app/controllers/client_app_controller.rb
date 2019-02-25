class ClientAppController < ActionController::Base
  def index
    article = Article.find_by(slug: params[:slug])
    @title = article&.title || "The Stuyvesant Spectator"
    @image = article&.media&.first&.attachment_url || "https://s3.amazonaws.com/stuyspec-images/the_logo.png"
    @description = article&.preview || "The Stuyvesant Spectator is a newspaper published by Stuyvesant High School students every two weeks."\
      "It contains sections such as news, features, opinions, arts & entertainment, humor, sports, photography, art, layout, copy, "\
      "business, and web. With such a wide range of topics, readers would never run out of reading material, which makes this "\
      "newspaper awesome!"
    @url = params[:section] and params[:slug] ? "https://stuyspec.com/#{params[:section]}/#{params[:slug]}"
      : "https://stuyspec.com"
    render template: "client_app/index", status: :ok
  end
end
