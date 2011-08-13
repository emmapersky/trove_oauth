module TroveOAuth
  class Photo
    attr_accessor :album_id, :date, :description, :height, :id, :license, :lat, :lng, :original_web_url, :owner, :photo_public, :service, :tags, :title, :urls, :width
    
    def initialize(id, date, original_url)
      self.id = id
      self.date = date
      self.urls = {:original => original_url}
      self.tags = []
    end
    
    def set_location(lat, lng)
      self.lat = lat
      self.lng = lng
    end
    
    def to_json
      {
        'album_id' => album_id,
        'date' => date.to_s,
        'description' => description,
        'height' => height,
        'id' => id,
        'license' => license,
        'loc' => [lat, lng],
        'original_web_url' => original_web_url,
        'owner' => owner,
        'public' => photo_public,
        'service' => service,
        'tags' => tags,
        'title' => title,
        'urls' => urls,
        'width' => width
      }.to_json
    end
  end
end