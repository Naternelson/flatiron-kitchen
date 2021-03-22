class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:edit, :show, :update]
  def new
    @ingredient = Ingredient.new
  end

  def show

  end

  def edit
  end

  def create
    @ingredient = Ingredient.create(stnd_params)
    redirect_to ingredients_path
  end

  def update
    @ingredient.update(stnd_params)
    redirect_to ingredient_path(@ingredient)
  end

  def index
    @ingredients = Ingredient.all
  end


  private

  def set_ingredient
    @ingredient = Ingredient.find_by params[:id]
  end

  def stnd_params
    params.require(:ingredient).permit(:name)
  end
end
