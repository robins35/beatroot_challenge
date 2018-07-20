require "httparty"

class TracksController < ApplicationController
  def index
    url = "#{beatroot_api_url}/tracks"
    header = { "Authorization" => "Token token=\"#{auth_token}\""}

    response = HTTParty.get(url, headers: header)

    @tracks = response.parsed_response["tracks"]
    meta = response.parsed_response["meta"]
  end

  def show
    #track_id = nil

    url = "#{beatroot_api_url}/track/#{track_id}"
  end

  private

  def beatroot_api_url
    base_url = Rails.application.credentials.beatroot[:base_url]
    account_slug = Rails.application.credentials.beatroot[:account_slug]

    "#{base_url}/accounts/#{account_slug}"
  end

  def auth_token
    Rails.application.credentials.beatroot[:authentication_token]
  end
end
