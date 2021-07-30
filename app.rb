require('sinatra')

get('/') do
  #home page
end

get('/albums') do
  #albums
end

get('/albums/new') do
  #new album
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
