class PetsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_pet, only: [:show, :edit, :update, :destroy]
  before_action :redirect, only: [:destroy, :edit]
  
  def index
    @pets = Pet.includes(:user).all.order('created_at DESC')
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

  def show

  end

  def edit
    if @pet.user_id == current_user.id 
    else
      redirect_to root_path
    end
  end

  def update
    @pet.update(pet_params)
    if @pet.valid?
      redirect_to pets_path(pet_params)
    else
      render 'edit'
    end
  end

  def destroy
    @pet.destroy
    redirect_to root_path
  end

  private
  def set_pet
    @pet = Pet.find(params[:id])
  end

  def redirect
    if current_user.id != @pet.user.id
      redirect_to action: :index 
    else
    end
  end

  def pet_params
    params.require(:pet).permit(:name, :information, :gender_id, :pet_kind, :image).merge(user_id:current_user.id)
  end

end
