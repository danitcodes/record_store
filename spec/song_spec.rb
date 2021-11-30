require 'spec_helper'

describe '#Song' do

  before(:each) do
    @album = Album.new({name: "Giant Steps", id: nil})
    @album.save()
  end
  # instance method test, as denoted by `#`; vs class method test, as denoted by `.`
  describe('#==') do
    it("is the same song if it has the same attributes as another song") do
      song = Song.new({name: 'Naima', album_id: @album.id, id: nil})
      song2 = Song.new({name: 'Naima', album_id: @album.id, id: nil})
      expect(song).to(eq(song2))
    end
  end

  describe('.find_by_album') do
    it("finds songs for an album") do
      album2 = Album.new({name: 'Blue', id: nil})
      album2.save()
      song = Song.new({name: "Giant Steps", album_id: @album.id, id: nil})
      song.save()
      song2 = Song.new({name: "Naima", album_id: album2.id, id: nil})
      song2.save()
      expect(Song.find_by_album(album2.id)).to(eq([song2]))
    end
  end

  describe('.all') do
    it("returns a list of an album's songs") do
      song = Song.new({name: 'Naima', album_id: @album.id, id: nil})
      song.save()
      song2 = Song.new({name: 'Cousin Mary', album_id: @album.id, id: nil})
      song2.save()
      expect(Song.all).to(eq([song, song2]))
    end
  end

  describe('#album') do
    it("finds the album a song belongs to") do
      song = Song.new({name: 'Naima', album_id: @album.id, id: nil})
      song.save()
      expect(song.album()).to(eq(@album))
    end
  end
end
