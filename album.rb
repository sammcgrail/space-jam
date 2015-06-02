class Album
  attr_accessor :tracks
  attr_reader :id, :title, :artist

  def initialize(id, title, artist)
    @id = id
    @title = title
    @artist = artist
    @tracks = []
  end

  def summary
    <<-SUMMARY
    Track id: #{id}
    Title: #{title}
    Artist: #{artist}\n
SUMMARY
  end
end
