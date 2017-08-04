class DosesController < ApplicationController
  before_action :set_cocktail, only: [:new, :create]

  # POST /cocktails/:cocktail_id/doses
  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail

    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'cocktails/show'
    end
  end

  # DELETE /doses/:id
  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

end





# DosesController
#   GET new
#     assigns a new dose as @dose (FAILED - 1)
#   POST create
#     with valid params
#       creates a new Dose (FAILED - 2)
#       assigns a newly created dose as @dose (FAILED - 3)
#       redirects to the created dose (FAILED - 4)
#     with invalid params
#       assigns a newly created but unsaved dose as @dose (FAILED - 5)
#       re-renders the 'new' template (FAILED - 6)
#   DELETE destroy
#     deletes a Dose (FAILED - 7)
