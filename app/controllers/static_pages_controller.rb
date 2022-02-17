class StaticPagesController < ApplicationController
  require 'flickr'

  def index
    begin
      flickr = Flickr.new ENV['FLICKER_KEY'], ENV['FLICKER_SECRET']
      unless params[:user_id].blank?
        @photos = flickr.photos.search(user_id: params[:user_id])
      else
        @photos = flickr.photos.getRecent
      end
      rescue StandardError => e
        flash[:alert] = "#{e.class}: #{e.message}. Please try again..."
        redirect_to root_path
      end
    end
end
