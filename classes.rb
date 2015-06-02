class Album
  attr_accessor :tracks
  attr_reader :id, :title, :artist
  def initialize(id, title, artist, tracks)
    @id = id
    @title = title
    @artist = artist
    @tracks = tracks
  end

  def build_tracklist_array
    tracklist = []
    tracks.each do |track_object|
      unless track_object.class == Hash
        if track_object.album_id == id
          tracklist << track_object
        end
      end
    end
    tracklist
  end

  def sum_duration
    album_duration = 0
    build_tracklist_array.each do |track_object|
      album_duration += track_object.convert_duration.round(2)
    end
    album_duration
  end

  def build_tracklist_string
    tracklist_string = ""
    build_tracklist_array.each do |track_object|
      tracklist_string += "#{track_object.track_number}. #{track_object.title} \n"
    end
    tracklist_string   # make sure to return values in methods
  end

  # def sort_tracklist_hash
  #    come back after and sort
  # end

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
  def convert_duration
    duration_min = (duration_ms.to_f / (1000 * 60)) # convert ms to min
    duration_min
  end
end













# newline
