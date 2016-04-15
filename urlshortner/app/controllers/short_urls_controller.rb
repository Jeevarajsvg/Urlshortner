class ShortUrlsController < ApplicationController
  require 'open-uri'

  before_filter :authorize

  def new
    @short_url = ShortUrl.new
  end

  def create
    @short_url = ShortUrl.new(short_url_params)
    if @short_url.save
      flash[:notice] = "Successfully created "
      redirect_to short_urls_path
    else
      render :new
    end
  end

  def index
    @short_urls = current_user.short_urls.paginate(:page => params[:page], :per_page => 2)
  end

  def destroy
    @short_url = ShortUrl.find_by_id(params[:short_url_id])
    @short_url.destroy
    flash[:notice] = "Successfully deleted "
    redirect_to short_urls_path
  end

  def original_url
    url = ShortUrl.find_by_shorty(shorty_params[:id])
    location = find_location
    if url.present?
      url.short_visits.create(visitor_ip: location["query"],visitor_city: location["city"], visitor_country_iso2: location["countryCode"],visitor_state: location["regionName"])
      url.visits_count+=1
      url.save
      redirect_to url.original_url
    end
  end

  private

  def shorty_params
    params.permit(:id)
  end

  def find_location
    response = open("http://ip-api.com/json/#{remote_ip}").read
    JSON.parse(response)
  end

  def short_url_params
    params.require(:short_url).permit(:original_url,:user_id,:id,:visits_count)
  end
end
