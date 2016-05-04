class BrandsController < ActionController::Base
  def index
    render json: Brand.all
  end

  def new
    @brand = Brand.new
  end

  def edit
    @brand = Brand.find_by(id: params[:id])
  end

  def update
    @brand = Brand.find_by(id: params[:id])
    @brand.update_attributes! brand_params
    redirect_to root_path
  end

  def create
    @brand = Brand.new(brand_params)
    if @brand.save
      redirect_to root_path
    end
  end

  def show
    @brand = Brand.find(params[:id])
    render json: @brand
  end

  def range
    @brands = Brand.where('id >= ?', params[:id])
    render json: @brands
  end

  def destroy
    Brand.destroy(params[:id])
  end

  def range_from_to
    @brands = Brand.where("id >= ?", params[:id]).limit(params[:count])
    render json: @brands
  end

  def count
    @brands = Brand.all
    render json: @brands.size
  end

  private
  def brand_params
    params.require(:brand).permit(:name, :description)
  end
end
