# Where Sinatra handles routing
# run application with CLI `ruby app.rb`

require('sinatra')
require('sinatra/reloader')
require('pry')
require('./lib/album')
#also_reload method tells app which files to reload
#globbing pattern ** - looks inside all dirs inside lib
#wildcard - * to reload all files w/ an .rb ext
also_reload('lib/**/*.rb')

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

get('/albums/:id') do
  #specific album based on ID, where value of ID is #{params[:id]}
end

post('/albums') do
  #adds an album to list of albums
end

get('/albums/:id/edit') do
  #updates an album w/ an ID of #{params[:id]}
end

patch('/albums/:id') do
  #updates an album
end

delete('/albums/:id') do
  #deletes an album
end

get('/custom_route') do
  #bonus routes as needed
end
