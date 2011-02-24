require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

require 'nzbmatrix.rb'
require 'lastfm.rb'

lastfm = LastFM.new

get '/' do
	haml :index
end

get '/similar' do
	@similar = lastfm.similar(params["artist"])

	haml :similar
end

get '/albums' do
	@albums = lastfm.albums(params["artist"])

	haml :albums
end
