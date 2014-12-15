json.array!(@wallpapers) do |wallpaper|
  json.extract! wallpaper, :id, :imageurl, :name, :description, :price
  json.url wallpaper_url(wallpaper, format: :json)
end
