class FlyersController < ApplicationController

    def create
        flyer = Flyer.new(flyer_params)
        if flyer.save
            redirect_to root_path
        else
            redirect_to root_path, alert: flyer.errors.full_messages
        end
    end

    def destroy
        Flyer.find(params[:id]).delete
        redirect_to root_path
    end

    private

    def flyer_params
    params.require(:flyer).permit(:name, :avatar, :link)
    end
end

