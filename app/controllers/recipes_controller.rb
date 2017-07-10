class RecipesController  < ApplicationController

        before_action :require_login

    def index
        # @recipes =Recipe.all
        @recipes =current_user.recipes.order(:id)
        
    end
    def new

    end
   
    def show
    @recipe =current_user.recipes.find(params[:id])

    end

    def new
        @recipe =current_user.recipes.build
    end

    def create
        @recipe =current_user.recipes.build(recipe_params)
        if @recipe.save
            redirect_to recipe_path(@recipe), notice: "Recipe Created"
        else
            @errors=@recipe.errors.full_messages
            render :new
        end

    end

    def edit
        @recipe =current_user.recipes.find_by_id(params[:id])
    end


    def update
        @recipe =current_user.recipes.find_by_id(params[:id])
        if @recipe.update_attributes(recipe_params)
            redirect_to recipe_path(@recipe), notice: "Recipe Updated !"
        else
            @errors=@recipe.errors.full_messages
            render :new
        end

    end


    def destroy
        recipe =Recipe.find_by_id(params[:id])
        recipe.destroy
        redirect_to recipes_path, notice: "Recipe deleted"
    end

    private

    def recipe_params
        params.require(:recipe).permit(:name,:description)
    end



end