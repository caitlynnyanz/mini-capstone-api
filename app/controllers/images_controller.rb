class ImagesController < ApplicationController
  def index
    images = Image.all
    render json: images.as_json
  end

  def show
    image = Image.find_by(id: params[:id])
    render json: image.as_json
  end
end
