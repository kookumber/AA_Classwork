class AlbumsController < ApplicationController
    
    def index #good
        @albums = Album.all
        render :index
    end

    def show #good
        @album = Album.find(params[:id])
        render :show
    end

    def create
        @album = Album.new(album_params)

        if @album.save!
            redirect_to album_url(@album)
        else
            render :new
        end
    end

    def new #_form partials
        @album = Album.new
        @band = Band.find(params[:band_id])
        render :new
    end

    def edit #_form partials
        @album = Album.find(params[:id])
        render :edit
    end

    def update
        @album = Album.find(params[:id])
        if @album.update(album_params)
            redirect_to album_url(@album)
        else
            render :edit
        end
    end
    
    def album_params
        params.require(:album).permit(:band_id, :live, :title, :year)
    end

    def destroy
        @album = Album.find(params[:id])
        @album.destroy
        redirect_to band_url(@album.band_id)
    end



end
