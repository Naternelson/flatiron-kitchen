class RecipesController < ApplicationController
  before_action :set_recipe, only: [:edit, :show, :update]
  def new
    @recipe = Recipe.new
  end

  def show
  end

  def edit
  end

  def create
    @recipe = Recipe.create(stnd_params)
    redirect_to recipe_path(@recipe)
  end


  def update
    @recipe.update(stnd_params)
    redirect_to recipe_path(@recipe)
  end

  def index
    @recipes = Recipe.all
  end


  private

  def set_recipe
    @recipe = Recipe.find_by params[:id]
  end
  
  def stnd_params
    params.require(:recipe).permit(:name, ingredient_ids: [], ingredients_attributes: [:name])
  end
end
