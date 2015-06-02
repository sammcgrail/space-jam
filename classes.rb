class Album
  attr_reader :id, :title, :artist, :tracks
  def initialize(id, title, artist)
    @id = id
    @title = title
    @artist = artist
    @tracks = []
  end
  def sum_duration
    album_duration = 0
    tracks.each do |track_object|
      album_duration += track_object.duration_ms.to_f
    end
    album_duration = (album_duration / (60000.0)).round(2)
    album_duration
  end
  def build_tracklist_string
    tracklist_string = ""
    tracks.each do |track_object|
      tracklist_string += "#{track_object.track_number}. #{track_object.title}\n"
    end
    tracklist_string   # make sure to return values in methods
  end
  def summary
    <<-SUMMARY
Album id: #{id}
Name: #{title}
Artist(s): #{artist}
Duration (min.): #{sum_duration}
Tracks:
#{build_tracklist_string}\n
SUMMARY
  end
end

class Track
  # attr_accessor :duration_min
  attr_reader :album_id, :id, :title, :track_number, :duration_ms
  def initialize(album_id, id, title, track_number, duration_ms)
    @album_id = album_id
    @id = id
    @title = title
    @track_number = track_number
    @duration_ms = duration_ms
  end
end
# newline
