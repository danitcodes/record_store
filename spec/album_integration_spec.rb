# require capybara's support for rspec
require('capybara/rspec')
# require the Sinatra app itself
require('./app')
#tells Capybara it will be testing this Sinatra application (as it can run many types of applications)
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

# difference from unit test - describe includes a second argument
# 2nd arg is a hash required for Capybara and RSpec to work together
describe('create an album path', {:type => :feature}) do
  it('creates an album and then goes to the album page') do
    visit('/albums')
    click_on('Add a new album')
    fill_in('album_name', :with => 'Yellow Submarine')
    click_on('Go')
    expect(page).to have_content('Yellow Submarine')
  end
end

# describe('create a song path', {:type => :feature}) do
#   it('creates an album and then goes to the album page') do
#     album = Album.new({:name => 'Yellow Submarine', :id => nil})
#     album.save
#     visit("/albums/#{album.id}")
#     fill_in('song_name', :with => 'All You Need Is Love')
#     click_on('Add song')
#     expect(page).to have_content('All You Need Is Love')
#   end
# end
