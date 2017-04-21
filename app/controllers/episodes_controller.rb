class EpisodesController < ApplicationController

  def index
    @episodes = Episode.all
  end

  def show
    @episode = Episode.find(params[:id])
    @appearance = Appearance.find_by(episode_id: @episode.id)
  end
end
