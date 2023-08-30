class RecordsController < ApplicationController
  before_action :authenticate_user
  before_action :ensure_correct_user
  before_action :ensure_correct_record, {only: [:show, :edit, :update, :destroy]}

  def new
    @pet = Pet.find(params[:pet_id])
    @record = Record.new
  end
  
  def create
    @record = Record.new(
      date_and_time: params[:date_and_time],
      amount_of_food: params[:amount_of_food],
      amount_of_water: params[:amount_of_water],
      note: params[:note],
      pet_id: params[:pet_id],
      user_id: @current_user.id
    )
    
    if @record.save
      flash[:notice] = "記録を登録しました"
      redirect_to("/pets/#{@record.pet_id}")
    else
      @pet = Pet.find(params[:pet_id])
      render("records/new", status: :unprocessable_entity)
    end
  end

  def show
    if Pet.exists?(id: params[:pet_id])
      @pet_name = Pet.find(params[:pet_id]).name
    else
      @pet_name = "未登録"
    end
  end
  
  def edit
  end
  
  def update
    @record.date_and_time = params[:date_and_time]
    @record.amount_of_food = params[:amount_of_food]
    @record.amount_of_water = params[:amount_of_water]
    @record.note = params[:note]
    @record.pet_id = params[:pet_id]
    
    if @record.save
      flash[:notice] = "修正しました"
      redirect_to("/pets/#{@record.pet_id}/records/#{@record.id}")
    else
      render("records/edit", status: :unprocessable_entity)
    end
  end

  def destroy
    @record.destroy
    flash[:notice] = "記録を削除しました"
    redirect_to("/pets/#{@record.pet_id}")
  end

  private

  def ensure_correct_user
    @pet = Pet.find_by(id: params[:pet_id])
    if @pet.nil? || @pet.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/users/#{@current_user.id}")
    end
  end

  def ensure_correct_record
    @record = Record.find_by(id: params[:id], pet_id: params[:pet_id])
    if @record.nil?
      flash[:notice] = "権限がありません"
      redirect_to("/users/#{@current_user.id}")
    end
  end
end
