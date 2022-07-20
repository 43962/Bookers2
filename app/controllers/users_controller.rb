class UsersController < ApplicationController
  def new
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.book.all
  end

  def edit
    @user = current_user
    if @user.save
    flash[:success] = 'You have updated user successfully.'
    end
  end

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  def update
    @user = current_user
    if @user.save
    redirect_to user_path(@user.id)
    flash[:success] = 'You have updated user successfully.'
    end
  end

end
