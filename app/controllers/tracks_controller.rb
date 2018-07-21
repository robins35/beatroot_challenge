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
    track_id = params[:id]
    url = "#{beatroot_api_url}/tracks/#{track_id}"
    header = { "Authorization" => "Token token=\"#{auth_token}\""}

    response = HTTParty.get(url, headers: header)

    if track_id && response.success?
      track_xml = response.parsed_response["track"].to_xml(root: "track", skip_types: true)

      respond_to do |format|
        format.html {
          send_data track_xml, filename: "track_#{track_id}.xml",
            type: 'application/xml',
            disposition: 'attachment'
        }
        format.xml {
          render xml: track_xml
        }
      end
    else
      head :not_found
    end
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
