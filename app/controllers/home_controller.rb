class HomeController < ApplicationController
  def index
    @short_url = ShortUrl.new
  end
end
