class Artist
  attr_reader :id, :name

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  def save
    result = DB.exec("INSERT INTO artists (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  def self.all
    returned_artists = DB.exec("SELECT * FROM artists;")
    artists = []
    returned_artists.each() do |artist|
      name = artist.fetch("name")
      id = artist.fetch("id").to_i
      artists.push(Artist.new({:name => name, :id => id}))
    end
    artists
  end

  def ==(artist_to_compare)
    self.name() == artist_to_compare.name()
  end

  def self.clear
    DB.exec("DELETE FROM artists *;")
  end

  def self.find(id)
    artist = DB.exec("SELECT * FROM artists WHERE id = #{id};").first
    name = artist.fetch("name")
    id = artist.fetch("id").to_i
    Artist.new({:name => name, :id => id})
  end

  def update(name)
    @name = name
    DB.exec("UPDATE artists SET name = '#{@name}' WHERE id = #{@id};")
  end

  def delete
    DB.exec("DELETE FROM songs WHERE album_id = #{@id};")
    DB.exec("DELETE FROM artists WHERE id = #{@id};")
    DB.exec("DELETE FROM albums_artists WHERE artist_id = #{@id};")
  end

  #not ideal to rely on another class to find songs, but is better than using global variables
  def songs
    Song.find_by_artist(self.id)
  end

  # @TODO rewrite method so it makes just two total queries, not n+1 queries.
  # see https://www.learnhowtoprogram.com/ruby-and-rails/ruby-database-basics/record-store-with-many-to-many#:~:text=something%20like%20this%3A-,SELECT,-*%20FROM%20albums%20where
  def albums
    albums = []
    results = DB.exec("SELECT album_id FROM albums_artists WHERE artist_id = #{@id};")
    results.each() do |result|
      album_id = result.fetch("album_id").to_i()
      album = DB.exec("SELECT * FROM albums WHERE id = #{album_id};")
      name = album.first().fetch("name")
      albums.push(Album.new({name: 'name', id: 'album_id'}))
    end
    albums
  end
end
