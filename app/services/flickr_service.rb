require 'flickraw'

class FlickrService
  def initialize
    FlickRaw.api_key = '5a3dc932fe790c7c5cd9c1437e568552'
    FlickRaw.shared_secret = '87f85c141f89b737'
  end

  def do_search(keyword, page = 1)
    flickr.photos.search(text: keyword, media: :photos, page: page).to_a
  end

  def search(keyword, page = 1)
    res = do_search(keyword, page)
    res.collect { |v| convert_result(v) }
  end

  def convert_result(result)
    hsh = result.to_hash.symbolize_keys!
    {url: convert_to_url(hsh), link: convert_to_user_url(result)}
  end

  def convert_to_url(photo_hash)
    "http://farm#{photo_hash[:farm]}.staticflickr.com/#{photo_hash[:server]}/#{photo_hash[:id]}_#{photo_hash[:secret]}_c.jpg"
  end

  def convert_to_user_url(photo_hash)
    "http://www.flickr.com/photos/#{photo_hash[:owner]}/#{photo_hash[:id]}"
  end
end
