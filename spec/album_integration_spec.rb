# require capybara's support for rspec
require('capybara/rspec')
# require the Sinatra app itself
require('./app')
require 'spec_helper'
#tells Capybara it will be testing this Sinatra application (as it can run many types of applications)
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

# difference from unit test - describe includes a second argument
# 2nd arg is a hash required for Capybara and RSpec to work together
describe('create an album path', {:type => :feature}) do
  it('creates an album and then goes to the album page') do
    # built-in Capybara methods...
    visit('/albums')
    click_on('Add a new album')
    fill_in('album_name', :with => 'Yellow Submarine')
    click_on('Go!')
    # make sure to choose a meaningful name for the expect assertion to find - using something as plain as "Album" could find the title on the page, or another instance of the word that doesn't matter for your testing purposes
    expect(page).to have_content('Yellow Submarine')
  end

  describe('create a song path', {:type => :feature}) do
    it('creates an album and then goes to the album page') do
      album = Album.new("Yellow Submarine", nil)
      album.save
      visit("/albums/#{album.id}")
      fill_in('song_name', :with => 'All You Need Is Love')
      click_on('Add song')
      expect(page).to have_content('All You Need Is Love')
    end
  end
end
