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

get '/oldest' do
	@athletes = Athlete.order_by(:age.desc).limit(10)
	erb :all
end

get '/youngest' do
	@athletes = Athlete.order_by(:age.asc).limit(10)
	erb :all
end

get '/men' do
	@athletes = Athlete.where(:sex=>"M")
	erb :all
end

get '/chinese_ladies' do
	@athletes = Athlete.where(:sex=>"F", :country=>"People's Republic of China")
	erb :all
end
