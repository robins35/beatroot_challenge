require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the TracksHelper. For example:
#
# describe TracksHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe TracksHelper, type: :helper do
  let(:track) {
    {
      "id"=>2,
      "title"=>"Sweet Lorraine",
      "url_token"=>"1a58ce9b-376b-4efe-ae7c-bb83f34f1590",
      "artist"=> {
        "id"=>8,
        "writer"=>false,
        "name"=>"Tony Crombie feat. Robert Robertson",
      },
    }
  }

  describe "#track_to_li" do
    it "includes the tracks title" do
      expect(helper.track_to_li(track)).to include("Sweet Lorraine")
    end
  end

  describe "#artist" do
    it "returns the track's artist name" do
      expect(helper.artist(track)).to eq("Tony Crombie feat. Robert Robertson")
    end
  end
end
