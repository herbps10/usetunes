require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

require 'nzbmatrix.rb'
require 'lastfm.rb'
require 'sab.rb'

lastfm = LastFM.new
nzbmatrix = NZBMatrix.new

get '/' do
	haml :index
end

get '/similar' do
	@similar = lastfm.similar(params[:artist])

	haml :similar
end

get '/similar/:artist' do |artist|
	@similar = lastfm.similar(artist)

	haml :similar
end

get '/albums/:artist' do |artist|
	@artist = artist
	@albums = lastfm.albums(artist)

	haml :albums
end

get '/nzbmatrix/:term' do |term|
	@items = nzbmatrix.find(term)
	haml :nzbmatrix
end

get '/sab/:id' do |id|
	SAB.send(NZBMatrix.download_url(id))

	"sent."
end
