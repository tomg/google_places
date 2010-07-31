module GooglePlaces
  
  class Client
    include HTTParty
    base_uri "http://maps.google.com/maps/api/place"
    format :json
    
    attr_reader :api_key, :client_id
                
    def initialize(options={})
      @api_key = options[:api_key] || GooglePlaces.api_key
      @client_id = options[:client_id] || GooglePlaces.client_id
    end

    def search(options={})
      request = "/search/json"
      query = options.merge(self.default_options)
      url_to_sign = "/maps/api/place" + request.to_s + query.to_s
      encoded_signature = self.signature(url_to_sign)
      
      mashup(self.class.get(request, :query => query.merge(encoded_signature)))
    end
    
    def details(options={})
      request = "/details/json"
      query = options.merge(self.default_options)
      url_to_sign = "/maps/api/place" + request.to_s + query.to_s
      encoded_signature = self.signature(url_to_sign)
      
      mashup(self.class.get(request, :query => query.merge(encoded_signature)))      
    end
    
    protected
    
    def default_options
      { :client => @client_id }
    end
    
    def signature(path)
      decoded_key = Base64.decode64(@api_key.tr("-_", "+/")) 
      signature = OpenSSL::HMAC.digest(OpenSSL::Digest::Digest.new('sha1'), decoded_key, path) 
      encoded_signature = Base64.encode64(signature).tr("+/", "-_").chomp
      
      { :signature => encoded_signature }
    end
    
    def mashup(response)
      case response.code
        when 200
          if response.is_a?(Hash)
            Hashie::Mash.new(response)
          else
            if response.first.is_a?(Hash)
              response.map{|item| Hashie::Mash.new(item)}
            else
              response
            end
          end
        end
      end
    end

end
