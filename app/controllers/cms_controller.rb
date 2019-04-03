class CmsController < ActionController::Base
  def index
    render file: 'public/cms/index.html'
  end
end
