class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  def paginated_product
    page = params[:page].to_i
    if params[:sort].to_s == "created_at"
      @products = Product.all.sort_by{|x| x.created_at}[(((page-1)*(PER_PAGE)))..(((page-1)*(PER_PAGE))+(PER_PAGE-1))]
    elsif params[:sort].to_s == "category"
      @products = Product.all.sort_by{|x| x.category.try("name").to_s}[(((page-1)*(PER_PAGE)))..(((page-1)*(PER_PAGE))+(PER_PAGE-1))]
    elsif params[:sort].to_s == "user_name"
      @products = Product.all.sort_by{|x| x.user.try("user_name").to_s}[(((page-1)*(PER_PAGE)))..(((page-1)*(PER_PAGE))+(PER_PAGE-1))]
    elsif params[:sort].to_s == "title"
      @products = Product.all.sort_by{|x| x.name.to_s}[(((page-1)*(PER_PAGE)))..(((page-1)*(PER_PAGE))+(PER_PAGE-1))]
    else
      @products = Product.all.sort_by{|x| x.created_at}[(((page-1)*(PER_PAGE)))..(((page-1)*(PER_PAGE))+(PER_PAGE-1))]
    end
    html = ""
    @products.each do |product|
    html +=  "<tr>
                <td> #{product.name.to_s}</td>
                <td>#{product.user.try('user_name').to_s}</td>
                <td>#{product.category.try('name').to_s}</td>
              </tr>"
    end
    render json: {status: false, message: html.html_safe}
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:user_id, :category_id,:name)
    end
end
