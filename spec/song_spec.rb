require 'rspec'
require 'song'
require 'album'
require 'pry'

describe '#Song' do
  # uses instance variables to DRY up tests w/ before(:each) blocks
  before(:each) do
    Album.clear()
    Song.clear()
    @album = Album.new("Giant Steps", nil)
    @album.save()
  end

  # instance method test, as denoted by `#`; vs class method test, as denoted by `.`
  describe('#==') do
    it("is the same song if it has the same attributes as another song") do
      song = Song.new("Naima", @album.id, nil)
      song2 = Song.new("Naima", @album.id, nil)
      expect(song).to(eq(song2))
    end
  end
end
