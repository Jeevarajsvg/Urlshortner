class ShortVisitsController < ApplicationController
  def show
    @short_visit = ShortVisit.where(short_url_id:params[:short_url_id])
  end
end
