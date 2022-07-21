class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  def new
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books.all
  end

  def edit
    @user = current_user
  end

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  def update
    @user = current_user
    if @user.update(user_params)
    redirect_to user_path(@user.id)
    flash[:success] = 'You have updated user successfully.'
    else
    render:edit
    end
  end


  private

  def correct_user
    @user = User.find(params[:id])
    redirect_to user_path(current_user.id) unless @user == current_user
  end

  def user_params
     params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
