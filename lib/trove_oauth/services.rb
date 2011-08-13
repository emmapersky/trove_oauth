module TroveOAuth
  class Client
    def services
      get("/v2/services/")
    end
    
    def service(service)
      get("/v2/services/#{service}/")
    end
    
    def service_bounceback_url(service, redirect_url)
      SITE + get_without_json("/v2/services/#{service}/bounceback")
    end
  end
end