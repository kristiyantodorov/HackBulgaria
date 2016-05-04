class CategoriesController < ActionController::Base
  def index
    render json: Category.all
  end

  def count
    render json: Category.all.count
  end

  def create
    @category = Category.new(category_params)
    @category.save
  end

  def update
    @category = Category.find_by(id: params[:id])
    @category.update_attributes(category_params)
  end

  def show
    render json: Category.find(params[:id])
  end

  def destroy
    Category.destroy(params[:id])
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end
