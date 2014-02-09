class Lecture < ActiveResource::Base
  self.site = ENV["AR_SERVER"]

end