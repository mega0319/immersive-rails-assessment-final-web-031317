class AppearancesController < ApplicationController

  def new
    @appearance = Appearance.new
  end

  def create
    @appearance = Appearance.new(appearance_params)
    @appearance.user_id = current_user.id
    if @appearance.save
      redirect_to @appearance.episode
    else
      redirect_to new_appearance_path
    end
  end

  def edit
    @appearance = Appearance.find_by(episode_id: params[:id])
  end

  def update
    @appearance = Appearance.find(params[:id])
    @appearance.update(appearance_params)
    if @appearance.save
      redirect_to @appearance.episode
    else
      redirect_to edit_appearance_path
    end
  end

  private

  def appearance_params
    params.require(:appearance).permit(:guest_id, :episode_id, :rating, :user_id)
  end

end
