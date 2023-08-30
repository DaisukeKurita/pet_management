class UsersController < ApplicationController
  before_action :authenticate_user, {only: [:show, :edit, :update, :destroy, :logout]}
  before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}
  before_action :ensure_correct_user, {only: [:show, :edit, :update, :destroy]}
  before_action :set_user, {only: [:show, :edit, :update, :destroy]}

  def new
    @user = User.new
  end

  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password]
    )
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "新規登録しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/new", status: :unprocessable_entity)
    end
  end

  def login_form
  end

  def login
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/users/#{@user.id}")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      render("login_form", status: :unprocessable_entity)
    end
  end

  def show
    @user = User.find(params[:id])
  end
  
  def edit
  end

  def update
    @user.name = params[:name]
    @user.email = params[:email]
    @user.password = params[:password]
    
    if @user.save
      flash[:notice] = "編集をしました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/edit", status: :unprocessable_entity)
    end
  end

  def destroy
    @user.destroy
    @user.pets.delete_all
    Record.where(user_id: @user.id).delete_all

    flash[:notice] = "アカウントを削除しました"
    redirect_to("/")
  end
  
  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/login")
  end

  private
  
  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to("/users/#{@current_user.id}")
    end
  end
  
  def set_user
    @user = User.find(params[:id])
  end
end
