class Studentvaluation < ActiveResource::Base
  #self.site = "http://g16-hh.de"
  #self.site = "http://localhost:3001"
  self.site = "http://#{ENV["AR_SERVER"]}"
end