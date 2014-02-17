class Course < ActiveResource::Base
  self.site = "http://#{ENV["AR_SERVER"]}"
end

