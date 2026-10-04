class ShortUrlsController < ApplicationController
  before_action :authenticate_user!, except: [ :new, :create, :redirect ]
  before_action :set_url, only: [ :show, :edit, :update, :destroy ]

  def redirect
    @short_url = ShortUrl.find_by!(code: params[:code])
    if @short_url.expires_at&.past?
      render plain: "Este enlace ha expirado", status: :gone
    else
      redirect_to @short_url.original_url, allow_other_host: true
    end
  end
  def index
    @short_urls = current_user.short_urls
  end

  def show
  end

  def new
    @short_url = ShortUrl.new
  end

  def create
    @short_url = ShortUrl.new(url_params)
    @short_url.code = SecureRandom.alphanumeric(6)
    @short_url.user = current_user if user_signed_in?
    if @short_url.save
      if user_signed_in?
      redirect_to @short_url
      else
        render :created
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @short_url.update(url_params)
      redirect_to @short_url
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @short_url.destroy
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def url_params
    permitted = [ :original_url ]
    permitted << :expires_at if user_signed_in?
    params.require(:short_url).permit(*permitted)
  end

  def set_url
    @short_url = current_user.short_urls.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end
end
