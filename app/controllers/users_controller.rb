class UsersController < ApplicationController
  before_action :ensure_corrent_user, only: [:edit, :update]

  def index
    @user = User.find(current_user.id)
    @users = User.all
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'You have updated your profile successfully!'
    else
      render 'edit'
    end
  end
  
  def ensure_corrent_user
    user = User.find(params[:id])
    unless user == current_user
      redirect_to user_path(user)
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
