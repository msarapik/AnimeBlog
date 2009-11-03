module ArticlesHelper
  def current_page?(options = {})
    return true if root_path == request.request_uri

    options.size > 0 ? super : false
  end
end
