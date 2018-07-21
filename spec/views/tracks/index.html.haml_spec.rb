require 'rails_helper'

RSpec.describe "tracks/index.html.haml", type: :view do
  let(:tracks) { [
    {
      "id"=>1,
      "title"=>"All Eyez On Me (feat. Big Syke)",
      "artist"=> {
        "id"=>2,
        "name"=>"Tupac",
      }
    },
    {
      "id"=>2,
      "title"=>"Electric Love",
      "artist"=> {
        "id"=>8,
        "name"=>"Borns",
      }
    },
    {
      "id"=>3,
      "title"=>"Atrevete te te",
      "artist"=> {
        "id"=>12,
        "name"=>"Calle 13",
      }
    }
  ]}

  it "renders" do
    assign(:tracks, tracks)
    render
  end

  it "renders the header" do
    assign(:tracks, tracks)
    render

    expect(rendered).to have_selector "h1", text: "Tracks"
  end

  it "renders the tracks list" do
    assign(:tracks, tracks)
    render

    expect(rendered).to have_selector "ul", id: "tracks" do |list|
      tracks.each do |track|
        expect(list).to contain track["title"]
        expect(list).to contain track["artist"]["name"]
        expect(list).to have_selector "li", id: track["id"]
      end
    end
  end
end
