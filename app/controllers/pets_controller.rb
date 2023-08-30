class PetsController < ApplicationController
  before_action :authenticate_user
  before_action :ensure_correct_user, {only: [:show, :edit, :update, :destroy]}

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(
      name: params[:name],
      animal_id: params[:animal_id],
      user_id: @current_user.id
      )

    if @pet.save
      flash[:notice] = "新規登録しました"
      redirect_to("/pets/#{@pet.id}")
    else
      render("pets/new", status: :unprocessable_entity)
    end
  end

  def show
  end
  
  def edit
  end
  
  def update
    @pet.name = params[:name]

    if @pet.save
      flash[:notice] = "修正しました"
      redirect_to("/pets/#{@pet.id}")
    else
      render("pets/edit", status: :unprocessable_entity)
    end
  end
  
  def destroy
    @pet.destroy
    flash[:notice] = "登録を解除しました"
    redirect_to("/users/#{@current_user.id}")
  end

  private

  def ensure_correct_user
    @pet = Pet.find_by(id: params[:id])
    if @pet.nil? || @pet.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/users/#{@current_user.id}")
    end
  end
end
