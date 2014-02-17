class Valuation < ActiveResource::Base
  self.site = "http://#{ENV["AR_SERVER"]}"
end