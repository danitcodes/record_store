class Album
  @@albums = {}

  def initialize(name)
    @name = name
  end

  def self.all
    @@albums.values()
  end

end
