# Where Sinatra handles routing
# run application with CLI `ruby app.rb`

require('sinatra')
require('sinatra/reloader')
require('./lib/album')
require('pry')
require('./lib/song')
also_reload('lib/**/*.rb')
#also_reload method tells app which files to reload
#globbing pattern ** - looks inside all dirs inside lib
#wildcard - * to reload all files w/ an .rb ext
require('pg')

DB = PG.connect({:dbname => "record_store"})

# @TODO add a proper index.erb page, not a redirect to albums
get('/') do
  @albums = Album.all
  erb(:albums)
end

get('/albums') do
  @albums = Album.all
  erb(:albums)
end

get('/albums/new') do
  erb(:new_album)
end

post('/albums') do
  name = params[:album_name]
  album = Album.new({name: name, id: nil})
  album.save()
  @albums = Album.all()
  erb(:albums)
end

get('/albums/:id') do
  @album = Album.find(params[:id].to_i())
  erb(:album)
end

get('/albums/:id/edit') do
  @album = Album.find(params[:id].to_i())
  erb(:edit_album)
end

patch('/albums/:id') do
  @album = Album.find(params[:id].to_i())
  @album.update(params[:name])
  redirect to ('/albums')
end

delete('/albums/:id') do
  @album = Album.find(params[:id].to_i())
  @album.delete()
  redirect to ('/albums')
end

# details for a specific song
get('/albums/:id/songs/:song_id') do
  # find song by song id
  @song = Song.find(params[:song_id].to_i())
  erb(:song)
end

# post a new song & route back to album view
post('/albums/:id/songs') do
  # find album by album id
  @album = Album.find(params[:id].to_i())
  # create new song based on params of song name & album id
  song = Song.new(params[:song_name], @album.id, nil)
  song.save()
  # return to album view
  erb(:album)
end

# edit a song & route back to album view
patch('/albums/:id/songs/:song_id') do
  # finds album by id
  @album = Album.find(params[:id].to_i())
  # find the song needed for view
  song = Song.find(params[:song_id].to_i())
  # associate the updated song to the specific album found
  song.update(params[:name], @album.id)
  # redirect to album to which the song belongs
  erb(:album)
end

# deletes a song & routes back to album view
delete('/albums/:id/songs/:song_id') do
  # finds song to be deleted
  song = Song.find(params[:song_id].to_i())
  # delete said song
  song.delete()
  # find the album associated with dead song
  @album = Album.find(params[:id].to_i())
  # reroutes back to album id found
  erb(:album)
end

get('/artists') do
  @artists = Artist.all
  erb(:artists)
end

get('/artists/new') do
  erb(:new_artist)
end

post('/artists') do
  name = params[:artist_name]
  artist = Artist.new({name: name, id: nil})
  artist.save()
  @artists = Artist.all()
  erb(:artists)
end

get('/artists/:id') do
  @artist = Artist.find(params[:id].to_i())
  erb(:artist)
end

get('/artists/:id/edit') do
  @artist = Artist.find(params[:id].to_i())
  erb(:edit_artist)
end

patch('/artists/:id') do
  @artist = Artist.find(params[:id].to_i())
  @artist.update(params[:name])
  redirect to ('/artists')
end

delete('/artists/:id') do
  @artist = Artist.find(params[:id].to_i())
  @artist.delete()
  redirect to ('/artists')
end
