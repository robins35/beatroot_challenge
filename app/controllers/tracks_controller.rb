class TracksController < ApplicationController
  def index
    base_url = Rails.application.credentials.beatroot[:base_url]
    account_slug = Rails.application.credentials.beatroot[:account_slug]
    auth_token = Rails.application.credentials.beatroot[:authentication_token]
  end

  def show
  end
end
