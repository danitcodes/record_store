class Album
  attr_reader :id, :name, :artist, :year, :genre, :length
  attr_accessor :name, :artist, :year, :genre, :length

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
    @artist = artist
    @year = year
    @genre = genre
    @length = length
  end

  def save
    result = DB.exec("INSERT INTO albums (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  def self.all
    # pg gem's `exec()` method``
    returned_albums = DB.exec("SELECT * FROM albums;")
    albums = []
    returned_albums.each() do |album|
      name = album.fetch("name")
      id = album.fetch("id").to_i
      albums.push(Album.new({:name => name, :id => id}))
    end
    albums
  end

  def ==(album_to_compare)
    self.name() == album_to_compare.name()
  end

  def self.clear
    DB.exec("DELETE FROM albums *;")
  end

  def self.find(id)
    album = DB.exec("SELECT * FROM albums WHERE id = #{id};").first
    name = album.fetch("name")
    id = album.fetch("id").to_i
    Album.new({:name => name, :id => id})
  end

  def update(name)
    @name = name
    DB.exec("UPDATE albums SET name = '#{@name}' WHERE id = #{@id};")
  end

  def delete
    DB.exec("DELETE FROM albums WHERE id = #{@id};")
    DB.exec("DELETE FROM songs WHERE album_id = #{@id};")
  end

  #not ideal to rely on another class to find songs, but is better than using global variables
  def songs
    Song.find_by_album(self.id)
  end
end

# @TODO fix bug where user tries to navigate to the URL of an album that doesn't exist
# see lesson for more info:
# https://www.learnhowtoprogram.com/ruby-and-rails/ruby-database-basics/deleting-dependents#:~:text=nil%0A%20%20end%0Aend-,Now,-our%20test%20passes
