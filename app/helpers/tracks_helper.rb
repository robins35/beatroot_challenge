module TracksHelper
  def track_to_li(track)
    id = track["id"]
    content_tag :li, class: "track", id: "track-#{id}" do
      content_tag :p do
        "#{track["title"]} - #{artist(track)}"
      end
    end
  end

  def artist(track)
    track["artist"]["name"]
  end
end
