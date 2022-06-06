class BandsController < ApplicationController

    def index
        @bands = Band.all
        render :index
    end

    def show
        @band = Band.find(params[:id])
        render :show
    end

    def create
        @band = Band.new(band_params)

        if @band.save!
            redirect_to band_url(@band)
        else
            render :new
        end
    end

    def new #_form partials
        @band = Band.new
        render :new
    end

    def edit #_form partials
        @band = Band.find(params[:id])
        render :edit
    end

    def update
        @band = Band.find(params[:id])
        if @band.update(band_params)
            redirect_to band_url(@band)
        else
            render :edit
        end
    end

    def destroy
        @band = Band.find(params[:id])
        @band.destroy
        redirect_to bands_url
    end

    def band_params
        params.require(:band).permit(:name)
    end

end
