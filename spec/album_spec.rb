require 'spec_helper'

describe '#Album' do
  describe('.all') do
    it("returns an empty array when there are no albums") do
      expect(Album.all).to(eq([]))
    end
  end

  describe('.save') do
    #can't be tested 1st otherwise will fail tests
    #covers two check - ability to save albums to mock db & verifies .all() works for multiple items
    it("saves an album") do
      album = Album.new({name: 'Giant Steps', id: nil})
      album.save()
      album2 = Album.new({name: 'Blue', id: nil})
      album2.save()
      expect(Album.all).to(eq([album, album2]))
    end
  end

  describe('#==') do
    it("is the same album if it has the same attributes as another album") do
      album = Album.new({name: 'Blue', id: nil}) #, "Marathon", 2021, "Neo-Punk", "53 minutes"})
      album2 = Album.new({name: 'Blue', id: nil})
      expect(album).to(eq(album2))
    end
  end

  describe('.clear') do
    it("clears all albums") do
      album = Album.new({name: 'Giant Steps', id: nil}) #, "Gigantic", 2011, "Indie", "49 minutes")
      album.save()
      album2 = Album.new({name: 'Blue', id: nil})
      album2.save()
      Album.clear()
      expect(Album.all).to(eq([]))
    end
  end

  describe('.find') do
    it("finds an album by id") do
      album = Album.new({name: 'Giant Steps', id: nil})
      album.save()
      album2 = Album.new({name: 'Blue', id: nil})
      album2.save()
      expect(Album.find(album.id)).to(eq(album))
    end
  end

  describe('#update') do
    it("updates an album by id") do
      album = Album.new({name: 'Giant Steps', id: nil})
      album.save()
      album.update("A Love Supreme")
      expect(album.name).to(eq("A Love Supreme"))
    end
  end

  describe("#delete") do
    it("deletes an album by id") do
      album = Album.new({name: 'Giant Steps', id: nil})
      album.save()
      album2 = Album.new({name: 'Blue', id: nil})
      album2.save()
      album.delete()
      expect(Album.all).to(eq([album2]))
    end
  end

  describe("#name") do
    it("returns the name of an album") do
      album = Album.new({:name => "In Rainbows", :id => nil, :artist => "Radiohead", :year => 2007, :genre => "Rock", :length => "42:39"})
      expect(album.name).to(eq("In Rainbows"))
    end
  end

describe('#delete') do
  it("deletes all songs belonging to a deleted album") do
    album = Album.new({:name => "A Love Supreme", :id => nil, :album => "A Love Supreme", :year => 1965, :genre => "Jazz", :length => "32 minutes, 49 seconds" })
    album.save()
    song = Song.new({:name => "Naima", :album_id => album.id, :id => nil})
    song.save()
    album.delete()
    expect(Song.find(song.id)).to(eq(nil))
  end
end
end
