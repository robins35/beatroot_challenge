module TracksHelper
  def track_description(track)
    "#{track['title']} - #{artist(track)}"
  end

  def artist(track)
    track["artist"]["name"]
  end
end
