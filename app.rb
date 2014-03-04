require 'sinatra'
require 'mongoid'
require 'pony'
require 'json'

require './athlete'

Mongoid.load!("mongoid.yml")

# Data from
# http://www.theguardian.com/sport/datablog/2012/aug/07/olympics-2012-athletes-age-weight-height#data

get '/' do
  erb :index
end

get '/all' do
  @athletes = Athlete.all
  erb :all
end