class ErrorsController < Spree::StoreController
  def error404
    render status: :not_found
  end
  def error500
    render status: :not_found
  end
  def error422
    render status: :not_found
  end
  def error503
    render status: :not_found
  end
end
