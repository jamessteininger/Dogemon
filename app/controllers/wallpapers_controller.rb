class WallpapersController < ApplicationController

  private

    def wallpaper_params
      params.require(:wallpaper).permit(:imageurl, :name, :description, :price)
    end
end

