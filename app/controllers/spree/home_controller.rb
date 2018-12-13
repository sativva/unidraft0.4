module Spree
  class HomeController < Spree::StoreController
    helper 'spree/products'
    respond_to :html

    def index
      # @searcher = build_searcher(params.merge(include_images: true))
      # @products = @searcher.retrieve_products
      # # @products = Spree::Product.all
      # @products = @products.includes(:possible_promotions) if @products.respond_to?(:includes)
      # @taxonomies = Spree::Taxonomy.includes(root: :children)

      # @subscriber = Subscriber.new
      # @message = Message.new


      @searcher = build_searcher(params.merge(include_images: true))
      @products = Spree::Product.all.where(level: "precommande", publish: true).or(Spree::Product.all.where(level: "en vente", publish: true))
      @drafts = Spree::Product.all.where(level: "croquis", publish: true)
      @drafts_on_top = @drafts.sample(3)
      @products = @products.includes(:possible_promotions) if @products.respond_to?(:includes)
      @taxonomies = Spree::Taxonomy.includes(root: :children)
      @product1 = @products[0]
      @product2 = @products[1]
      @designers = []
          @products.where.not(level: 'croquis').each do |u|
            if !@designers.include? Spree::Designer.find(u.designer_id)
              @designers << Spree::Designer.find(u.designer_id)
            end
          end
    end
  end
end
