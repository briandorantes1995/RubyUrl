module ApplicationHelper
  def short_url_link(short_url)
    "#{request.base_url}/#{short_url.code}"
  end
end
