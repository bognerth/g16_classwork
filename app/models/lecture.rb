class Lecture < ActiveResource::Base
  self.site = "http://g16-hh.de" #"http://#{ENV["AR_SERVER"]}"
end

