class UsersController < ApplicationController
  def new
  end  
  
  def show
    @book = Book.new
    @user = User.find(params[:id])
  end

  def edit
  end

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end
end
