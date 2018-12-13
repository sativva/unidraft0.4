class Spree::DesignersController < Spree::StoreController
  before_action :set_designer, only: [ :show, :edit, :update, :destroy, :follow]
  attr_accessor :file_file_name
  attr_accessor :banner_file_name
  # GET /designers
  # GET /designers.json
  def index

    @products = Spree::Product.all
    @designers = []
    @products.where.not(level: 'croquis').where(publish: true).each do |u|
      if !@designers.include? Spree::Designer.find(u.designer_id)
        @designers << Spree::Designer.find(u.designer_id)
      end
    end

  end

  # GET /designers/1
  # GET /designers/1.json
  def show
    @products = Spree::Product.all.where(publish: true, designer_id: params[:id])
  end

  # GET /designers/new
  def new
    @designer = Spree::Designer.new
  end

  # GET /designers/1/edit
  def edit
  end

  # POST /designers
  # POST /designers.json
  def create
    @designer = Spree::Designer.new(designer_params)

    respond_to do |format|
      if @designer.save
        format.html { redirect_to @designer, notice: 'Designer was successfully created.' }
        format.json { render :show, status: :created, location: @designer }
      else
        format.html { render :new }
        format.json { render json: @designer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /designers/1
  # PATCH/PUT /designers/1.json
  def update
    respond_to do |format|
      if @designer.update(designer_params)
        format.html { redirect_to @designer, notice: 'Designer was successfully updated.' }
        format.json { render :show, status: :ok, location: @designer }
      else
        format.html { render :edit }
        format.json { render json: @designer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /designers/1
  # DELETE /designers/1.json
  def destroy
    @designer.destroy
    respond_to do |format|
      format.html { redirect_to designers_url, notice: 'Designer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def follow

    if spree_current_user.following? @designer
      spree_current_user.stop_following(@designer)
    else
      spree_current_user.follow(@designer)
    end
    # redirect_to '/designers'

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
    # Use callbacks to share common setup or constraints between actions.
    def set_designer
      @designer = Spree::Designer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def designer_params
      params.require(:designer).permit(
        :lastname,
        :givenname,
        :school,
        :linkedin,
        :instagram,
        :facebook ,
        :website,
        :profilepic,
        :universpics,
        :interview,
        :universvid,
        :avatar,
        :video,
        :banner
        )
    end
end
