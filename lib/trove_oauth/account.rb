module TroveOAuth
  class Client
    def info
      get("/v2/user/")
    end
    
    def evil_send(method, params)
      self.send(method, *params)
    end
  end
end