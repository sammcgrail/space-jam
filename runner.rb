require 'csv'
require 'pry'
require_relative 'classes'

tracks = []
albums = []


CSV.foreach('space_jams.csv', headers: true, header_converters: :symbol) do |row|
  track = row.to_hash

  tracks << Track.new(track[:album_id], track[:album_name], track[:title], track[:track_number], track[:duration_ms])
  # binding.pry
end

CSV.foreach('space_jams.csv', headers: true, header_converters: :symbol) do |row|
  track = row.to_hash
  album = albums.find { |a| a.id == track[:album_id] }
  album_tracks = []
  # tracks.each do |track_object|
  #   if track_object.album_id == track[:album_id]
  #     album_tracks << track_object
  #     binding.pry
  #   end
  # end
  # if the album hasn't been added to the albums array yet, add it
  if album.nil?
    album = Album.new(track[:album_id], track[:album_name], track[:artists], tracks)
    albums << album
  end

  # add the track to the album's @tracks instance variable
  album.tracks << track
end

# print out the summary for each album
albums.each do |album|
  puts album.summary
end
