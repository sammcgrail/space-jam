class Album
  attr_accessor :tracks
  attr_reader :id, :title, :artist

  def initialize(id, title, artist)
    @id = id
    @title = title
    @artist = artist
    @tracks = []
  end

  def build_tracklist_hash
    tracklist_hash = {}
    @tracks.each do |track_info|
      if track_info[:album_id] == id
        tracklist_hash[track_info[:track_number]] = track_info[:title]
      end
    end
  end

  def sort_tracklist_hash

  end


  # return string of tracknames
  # iterate through array of hashes
  # each hash contain one track data

  # if album id =
  # add track name to tracklist


  def summary
    <<-SUMMARY
    Album id: #{id}
    Album Title: #{title}
    Album Artist: #{artist}\n
SUMMARY
  end









end
