module TroveOAuth
  class Client
    
    def initialize(options = {})
      @consumer_key = options[:consumer_key]
      @consumer_secret = options[:consumer_secret]
      @token = options[:token]
      @secret = options[:secret]
      @proxy = options[:proxy]
    end
  
    def authorize(token, secret, options = {})
      request_token = OAuth::RequestToken.new(
        consumer, token, secret
      )
      @access_token = request_token.get_access_token(options)
      @token = @access_token.token
      @secret = @access_token.secret
      @access_token
    end
  
    def show(username)
      get("/users/show/#{username}.json")
    end
    
    # Returns the string "ok" in the requested format with a 200 OK HTTP status code.
    def test
      get("/help/test.json")
    end
    
    def request_token(options={})
      consumer.get_request_token(options)
    end
    
    def authentication_request_token(options={})
      consumer.options[:authorize_path] = '/oauth/authenticate'
      request_token(options)
    end
  
  

    def access_token
      @access_token ||= OAuth::AccessToken.new(consumer, @token, @secret)
    end
        
    private
    

      def consumer
        @consumer = OAuth::Consumer.new(@consumer_key, @consumer_secret, 
          :site => API,
          :authorize_path => '/oauth/authorize/', 
          :access_token_path => SITE + '/oauth/access_token/', 
          :request_token_path => '/oauth/request_token/', 
          :http_method => :get, 
          :signature_method => 'PLAINTEXT',
          :scheme=> :query_string)
      end

      
      def get(path, headers={})
        headers.merge!("User-Agent" => "trove_oauth gem v#{TroveOAuth::VERSION}")
        oauth_response = access_token.get(path, headers)
        JSON.parse(oauth_response.body)
      end

      def get_without_json(path, headers={})
        headers.merge!("User-Agent" => "trove_oauth gem v#{TroveOAuth::VERSION}")
        oauth_response = access_token.get(path, headers)
        oauth_response.body
      end      

      def post(path, body='', headers={})
        headers.merge!("User-Agent" => "trove_oauth gem v#{TroveOAuth::VERSION}")
        oauth_response = access_token.post("/1#{path}", body, headers)
        JSON.parse(oauth_response.body)
      end
      
      def post_without_json(path, body='', headers={})
        headers.merge!("User-Agent" => "trove_oauth gem v#{TroveOAuth::VERSION}")
        access_token.post("/1#{path}", body, headers).body
      end
      
      def delete(path, headers={})
        headers.merge!("User-Agent" => "trove_oauth gem v#{TroveOAuth::VERSION}")
        oauth_response = access_token.delete("/1#{path}", headers)
        JSON.parse(oauth_response.body)
      end
  end
end