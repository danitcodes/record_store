require 'spec_helper'

describe '#Artist' do
  describe('.all') do
    it("returns an empty array when there are no artists") do
      expect(Artist.all).to(eq([]))
    end
  end

  describe('.save') do
    it("saves an artist") do
      artist = Artist.new({name: 'Mac Demarco', id: nil})
      artist.save()
      artist2 = Artist.new({name: 'Aimee Mann', id: nil})
      artist2.save()
      expect(Artist.all).to(eq([artist, artist2]))
    end
  end

  describe('#==') do
    it("is the same artist if it has the same attributes as another artist") do
      artist = Artist.new({name: 'Otis Redding', id: nil})
      artist2 = Artist.new({name: 'Otis Redding', id: nil})
      expect(artist).to(eq(artist2))
    end
  end

  describe('.clear') do
    it("clears all artists") do
      artist = Artist.new({name: 'Otis Redding', id: nil})
      artist.save()
      artist2 = Artist.new({name: 'Blue', id: nil})
      artist2.save()
      Artist.clear()
      expect(Artist.all).to(eq([]))
    end
  end

  describe('.find') do
    it("finds an artist by id") do
      artist = Artist.new({name: 'Otis Redding', id: nil})
      artist.save()
      artist2 = Artist.new({name: 'Blue', id: nil})
      artist2.save()
      expect(Artist.find(artist.id)).to(eq(artist))
    end
  end

  describe('.update') do
    it("updates an artist by id") do
      artist = Artist.new({name: 'Blue', id: nil})
      artist.save()
      artist.update('Blue Man Group')
      expect(artist.name).to(eq("Blue Man Group"))
    end
  end

  describe('.update') do
    it("adds an album to an artist") do
      artist = Artist.new({:name => "John Coltrane", :id => nil})
      artist.save()
      album = Album.new({:name => "A Love Supreme", :id => nil})
      album.save()
      artist.update({:album_name => "A Love Supreme"})
      expect(artist.albums).to(eq([album]))
    end
  end

  # ^^ @TODO A separate test should be written to make sure that an Artist's name can be updated as well.

  describe("#delete") do
    it("deletes an artist by id") do
      artist = Artist.new({name: 'Otis Redding', id: nil})
      artist.save()
      artist2 = Artist.new({name: 'Blue', id: nil})
      artist2.save()
      artist.delete()
      expect(Artist.all).to(eq([artist2]))
    end
  end

  describe("#name") do
    it("returns the name of an artist") do
      artist = Artist.new({:name => "Otis Redding", :id => nil})
      expect(artist.name).to(eq("Otis Redding"))
    end
  end

  # describe('#delete') do
  #   it("deletes all songs belonging to a deleted artist") do
  #     artist = Artist.new({:name => "Otis Redding", :id => nil })
  #     artist.save()
  #     song = Song.new({:name => "Try a Little Tenderness", :album_id => @album.id, :id => nil})
  #     song.save()
  #     artist.delete()
  #     expect(Song.find(song.id)).to(eq(nil))
  #   end
  # end
end
