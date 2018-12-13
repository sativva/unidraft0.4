module Spree
  class DraftsController < Spree::StoreController
    before_action :load_product, only: [:show, :vote2, :unvote]
    before_action :load_taxon, only: :index
    rescue_from ActiveRecord::RecordNotFound, with: :render_404
    helper 'spree/taxons'
    helper_method :vote
    helper_method :connect

    respond_to :html

    def index
      @searcher = build_searcher(params.merge(include_images: true))
      @products = @searcher.retrieve_products
      @products = @products.includes(:possible_promotions) if @products.respond_to?(:includes)
      @products = @products.where(publish: true).where(level: 'croquis').shuffle
      @taxonomies = Spree::Taxonomy.includes(root: :children)
    end


    def show
      @products = Spree::Product.all.where(level: ['precommande', 'en vente'], publish: true).where.not(id: @product.id)
      @variants = @product.variants_including_master.
                           spree_base_scopes.
                           active(current_currency).
                           includes([:option_values, :images])
      @product_properties = @product.product_properties.includes(:property)
      @taxon = params[:taxon_id].present? ? Spree::Taxon.find(params[:taxon_id]) : @product.taxons.first
      redirect_if_legacy_path
      @designer = Spree::Designer.find(@product.designer_id)
      if @product.level == 'precommande'
        @daysleft = (@product.date_of_sale - DateTime.now.to_date).to_i
        @presale_time = (@product.date_of_sale - @product.available_on.to_date).to_i
        @presale_percent = 100 -(100 / @presale_time * @daysleft)
      end
      @drafts = Spree::Product.all.where(level: 'croquis').without(*@product)
    end

    def connect
      render partial: 'shared/connect'
    end

    def vote

        render partial: 'shared/vote'

    end

    def vote2
       @product.liked_by spree_current_user
        respond_to do |format|
          format.html { redirect_to :back }
          format.js
        end
    end

    def unvote
      @product.unliked_by spree_current_user
      respond_to do |format|
        format.html { redirect_to :back }
        format.js
        end
    end

    # def upvote
    #  @product = Spree::Product.find(params['id'])
    #  @product.upvote_by spree_current_user
    #  redirect_to @product
    # end

    def upvote
      @product = Spree::Product.friendly.find(params['id'])
      if  spree_current_user.voted_for? @product
        @product.unvote_by spree_current_user
      else
        @product.upvote_by spree_current_user
      end
      # redirect_to '/'

      # respond_to do |format|
      #   if spree_current_user.voted_for? @product
      #     format.html { redirect_to :back }
      #     format.json { head :no_content }
      #     format.js { render :layout => false }

      #     @product.unvote_by spree_current_user
      #   else
      #     format.html { redirect_to :back }
      #     format.json { head :no_content }
      #     format.js { render :layout => false }

      #     @product.upvote_by spree_current_user
      #   end
      #  end
    end

    private

      def accurate_title
        if @product
          @product.meta_title.blank? ? @product.name : @product.meta_title
        else
          super
        end
      end

      def load_product
        if try_spree_current_user.try(:has_spree_role?, "admin")
          @products = Product.with_deleted
        else
          @products = Product.active(current_currency)
        end
        @product = @products.includes(:variants_including_master, variant_images: :viewable).friendly.find(params[:id])
      end

      def load_taxon
        @taxon = Spree::Taxon.find(params[:taxon]) if params[:taxon].present?
      end

      def redirect_if_legacy_path
        # If an old id or a numeric id was used to find the record,
        # we should do a 301 redirect that uses the current friendly id.
        if params[:id] != @product.friendly_id
          params[:id] = @product.friendly_id
          params.permit!
          return redirect_to url_for(params), status: :moved_permanently
        end
      end
  end
end

