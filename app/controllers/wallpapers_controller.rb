class WallpapersController < InheritedResources::Base

  private

    def wallpaper_params
      params.require(:wallpaper).permit(:imageurl, :name, :description)
    end
end

