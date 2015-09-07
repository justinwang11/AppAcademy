require 'json'
require 'webrick'

module Phase4
  class Session
    # find the cookie for this app
    # deserialize the cookie into a hash
    def initialize(req)
      req.cookies.each do |cookie|
        if cookie.name == "_rails_lite_app"
          @cookieval = JSON.parse(cookie.value)
        end
      end
      @cookieval ||= {}
    end

    def [](key)
      @cookieval[key]
    end

    def []=(key, val)
      @cookieval[key] = val
    end

    # serialize the hash into json and save in a cookie
    # add to the responses cookies
    def store_session(res)
      rescookie = WEBrick::Cookie.new('_rails_lite_app', @cookieval.to_json)
      res.cookies << rescookie
    end
  end
end
