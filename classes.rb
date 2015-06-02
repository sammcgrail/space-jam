class Album
  attr_accessor :tracks
  attr_reader :id, :title, :artist
  def initialize(id, title, artist, tracks)
    @id = id
    @title = title
    @artist = artist
    @tracks = tracks
  end
  def build_tracklist_hash
    tracklist_hash = {}
    @tracks.each do |track_info|
      if track_info[:album_id] == id
        tracklist_hash[track_info[:track_number]] = track_info[:title]
      end
    end
    tracklist_hash
  end
  def build_tracklist_string
    tracklist_string = ""
    build_tracklist_hash.each do |track_number, track_name|
      tracklist_string += "#{track_number}. #{track_name} \n"
    end
    tracklist_string   # make sure to return values in methods
  end

  # def sort_tracklist_hash
  #    come back after and sort
  # end

  def get_duration_ms
    #
  end

  def convert_duration
    # convert duration_ms to min
  end

  def summary
    <<-SUMMARY
Album id: #{id}
Album Title: #{title}
Album Artist: #{artist}
Tracklist:
#{build_tracklist_string}\n
SUMMARY
  end
end

class Track
  attr_accessor :duration_min
  attr_reader :album_id, :id, :title, :track_number, :duration_ms
  def initialize(album_id, id, title, track_number, duration_ms)
    @album_id = album_id
    @id = id
    @title = title
    @track_number = track_number
    @duration_ms = duration_ms
    @duration_min = 0
  end







end













# newline
