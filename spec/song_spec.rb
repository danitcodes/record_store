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

  #moar CRUD tests here

  describe('.find_by_album') do
    it("finds songs for an album") do
      album2 = Album.new("Blue", nil)
      album2.save()
      song = Song.new("Naima", @album.id, nil)
      song.save()
      song2 = Song.new("California", album2.id, nil)
      song2.save()
      expect(Song.find_by_album(album2.id)).to(eq([song2]))
    end
  end

  describe('#songs') do
    it("returns an album's songs") do
      album = Album.new("Giant Steps", nil)
      album.save()
      song = Song.new("Naima", album.id, nil)
      song.save()
      song2 = Song.new("Cousin Mary", album.id, nil)
      song2.save()
      expect(album.songs).to(eq([song, song2]))
    end
  end

  describe('#album') do
    it("finds the album a song belongs to") do
      song = Song.new("Naima", @album.id, nil)
      song.save()
      expect(song.album()).to(eq(@album))
    end
  end
end
