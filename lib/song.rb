class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new_song = self.new
    new_song.save
    new_song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    self.all << song
    song
  end

  def self.find_by_name(name)
    found_song = self.all.find do |instance|
      instance.name == name
    end
    found_song
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      found_song = self.all.find do |instance|
        instance.name = name
      end
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by do |instance|
      instance.name
    end
  end

  def self.new_from_filename(filename)
    parsed = filename.split(" - ")
    song_name = parsed[1][0..-5]
    new_song = self.create_by_name(song_name)
    new_song.artist_name = parsed[0]
    new_song
  end

  def self.create_from_filename(filename)
    parsed = filename.split(" - ")
    song_name = parsed[1][0..-5]
    new_song = self.create_by_name(song_name)
    new_song.artist_name = parsed[0]
  end

  def self.destroy_all
    @@all.clear
  end

end
