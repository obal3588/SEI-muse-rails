class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
    @songs = @artist.songs
  end

  ##create an obj that view can fill it and edit ,than call create action methouds
  def new
    @artist = Artist.new
  end

  def create
    #.permit //صلاخيات
    Artist.create(params.require(:artist).permit(:name, :albums, :hometown, :img))
    redirect_to artists_path
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    artist = Artist.find(params[:id])
    artist.update(params.require(:artist).permit(:name, :albums, :hometown, :img))
    redirect_to artists_path
  end
end
