class ArtistsController < ApplicationController
  def create
    @artist = Artist.new(artist_params(:name, :bio))
    @artist.save
    redirect_to artist_path(@artist)
  end

  def new
    @artist = Artist.new 
  end
  
  def edit 
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])
    @artist = Artist.update(artist_params(:name, :bio))
    redirect_to artist_path(@artist)
  end

  def show
    @artist = Artist.find(params[:id])
  end

  private
  def artist_params(*args)
		params.require(:artist).permit(*args)
	end

end
