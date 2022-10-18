class PetsController < ApplicationController
  def index
    @pets = Pet.all.order("created_at DESC")
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    if @pet.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :information, :gender_id, :pettype).merge(user_id:current_user.id)
  end

end
