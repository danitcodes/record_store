class Album
  attr_reader :id, :name

  @@albums = {}
  # class variable that mocks a database
  @@total_rows = 0
  # a class variable to keep track of total # rows & increment value for new Albums

  def initialize(name, id)
    @name = name
    @id = id || @@total_rows += 1
    # if `id` has a value, it will become the value of @id; if `id` is `nil`, value of @id will be @@total_rows += 1
    # doesn't add a new row if an album already has an id
  end

  def self.all
    @@albums.values()
  end

  def save
    @@albums[self.id] = Album.new(self.name, self.id)
  end

  def == (album_to_compare)
    self.name() == album_to_compare.name()
  end

  def self.clear
    # resets the value of @@albums to an empty hash
    # and resets rows, too
    @@albums == {}
    @@total_rows = 0
  end

  def self.find(id)
    @@albums[id]
  end

  def update(name)
    @name = name
  end

  def delete
    @@albums.delete(self.id)
  end
end
