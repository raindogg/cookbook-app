class RecipesController < ApplicationController
  
  before_action :authenticate_user!, except: [:index, :new]

  def index
    sort_attribute = params[:sort]
    @recipes = Recipe.all
    if sort_attribute
      @recipes = @recipes.order(sort_attribute)
    end
  end

  def new
  end

  def create
    @recipe = Recipe.create(title: params[:title],
                            user_id: current_user.id,
                            prep_time: params[:prep_time],
                            ingredients: params[:ingredients],
                            directions: params[:directions])
    flash[:success] = 'Recipe added.'
    redirect_to "/recipes/#{@recipe.id}"
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit 
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(title: params[:title],
                   prep_time: params[:prep_time],
                   ingredients: params[:ingredients],
                   directions: params[:directions])
    flash[:success] = "Recipe updated."
    redirect_to "/recipes/#{@recipe.id}"
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    flash[:warning] = "It's gone forever." 
    redirect_to '/recipes'
  end
end
