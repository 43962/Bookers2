class BooksController < ApplicationController
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
      render:index
    end
  end

  def update
    @book.user_id = current_user.id
    if @book.save
    redirect_to user_path(@book.id)
    flash[:success] = 'You have updated user successfully.'
    
    end
  end
  
  def destroy
    @book.user_id = current_user
    @post_image.destroy
    redirect_to book_path
  end  



  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
