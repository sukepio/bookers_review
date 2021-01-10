class BooksController < ApplicationController
  before_action :ensure_corrent_user, only: [:edit, :update, :destroy]
  
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book), notice: 'You have created a book successfully!'
    else
      @user = User.find_by(id: @book.user_id)
      @books = Book.all
      render 'index'
    end
  end

  def index
    @user = User.find(current_user.id)
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @book_comment = BookComment.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: 'You have updated your book successfully!'
    else
      render 'edit'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
  
  
  def ensure_corrent_user 
    book = Book.find(params[:id])
    unless book.user == current_user
      redirect_to user_path(book.user)
    end
    
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :content)
  end

end
