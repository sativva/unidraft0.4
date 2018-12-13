class TinymceAssetsController < ApplicationController
    respond_to :json

  def create
    # authorize! :create, TinymceAsset
    #   image = TinymceAsset.create params.permit(:file)

    #   render json: {
    #     image: {
    #       url: image.file.url
    #     }
    #   }, content_type: "text/html"
    geometry = Paperclip::Geometry.from_file params[:file]
    image    = Spree::Designer.create params.permit(:file)

    render json: {
      image: {
        url:    image.file.url,
        height: geometry.height.to_i,
        width:  geometry.width.to_i
      }
    }, layout: false, content_type: "text/html"
  end
end
