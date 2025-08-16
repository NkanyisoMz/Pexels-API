# app/controllers/static_pages_controller.rb
require "ostruct"  # <-- add this line at the top

class StaticPagesController < ApplicationController
  def home
    collection_id = "roq1nzt"
    collection = PEXELS_CLIENT.collections[collection_id]

    # Wrap each Pexels::Photo in OpenStruct so we can use .photographer safely
    @photos = collection.media.map do |photo|
      OpenStruct.new(
        src: photo.src,
        photographer: photo.instance_variable_get(:@photographer)
      )
    end
  end

  def show_collection
    collection_id = params[:collection_id]
    collection = PEXELS_CLIENT.collections[collection_id]

    @photos = collection.media.map do |photo|
      OpenStruct.new(
        src: photo.src,
        photographer: photo.instance_variable_get(:@photographer)
      )
    end

    render :home
  end
end
