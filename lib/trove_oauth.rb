require 'oauth'
require 'json'
#require 'mime/types'
require 'oauth'
require 'oauth/signature/plaintext'

require 'trove_oauth/client'
require 'trove_oauth/plaintext'
require 'trove_oauth/account'
require 'trove_oauth/photos'
require 'trove_oauth/services'
require 'trove_oauth/photo'
module TroveOAuth
  VERSION = '0.0.1'
  API_VERSION_PATH = "/v1"
  SITE = 'https://www.yourtrove.com'
  API = 'https://api.yourtrove.com'
    
  class APIError < Exception
    
  end
  
  class InternalError < Exception
    
  end
end