require 'csv'
require_relative 'classes'

albums = []

CSV.foreach('space_jams.csv', headers: true, header_converters: :symbol) do |row|
  info = row.to_hash
  album = albums.find { |a| a.id == info[:album_id] }

  # if the album hasn't been added to the albums array yet, add it
  if album.nil?
    album = Album.new(info[:album_id], info[:album_name], info[:artists])
    albums << album
  end

  # add the track to the album's @tracks instance variable
  track = Track.new(info[:album_id], info[:id], info[:title], info[:track_number], info[:duration_ms])
  album.tracks << track
end

# print out the summary for each album
albums.each do |album|
  puts album.summary
end
