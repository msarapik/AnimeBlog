module ArticlesHelper
  def current_page?(options = {})
    root_path == request.request_uri ? true : super
  end
end
