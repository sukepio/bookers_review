class LikesController < ApplicationController
  
  
  def create
    book = Book.find(params[:book_id])
    like = current_user.likes.new(book_id: book.id)
    like.save
    redirect_to books_path
  end

  def destroy
    book = Book.find(params[:book_id])
    like = current_user.likes.find_by(book_id: book.id)
    like.destroy
    redirect_to books_path
  end
end
