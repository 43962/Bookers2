class BooksController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  def new
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @bookn = Book.new
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id)
      flash[:success] = 'You have created book successfully.'
    else
     @books = Book.all
     @user = current_user
      render:index
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id)
      flash[:success] = 'You have updated user successfully.'
    else
      render:edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.user_id = current_user.id
    @book.destroy
    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])
  end





  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end

  def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to(books_path) unless @user == current_user
  end
end
