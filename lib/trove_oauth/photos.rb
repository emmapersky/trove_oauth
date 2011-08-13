module TroveOAuth
  class Client
    
    def add_photo(photo)
      raise InternalError.new("Supplied photo must be of type TroveOAuth::Photo") unless photo.is_a? Photo
      
      
      
    end
    
    def list_photos(params = {})
      if params[:query_object]

      else
        params[:tags] = params[:tags].join(',') if params[:tags].is_a? Array
        params[:services] = params[:services].join(',') if params[:services].is_a? Array
        query_string = params.map{|k,v| "#{CGI.escape(k)}=#{CGI.escape(v)}"}.join("&")
        get("/v2/content/photos/?#{query_string}")
      end
    end
    
  end
end