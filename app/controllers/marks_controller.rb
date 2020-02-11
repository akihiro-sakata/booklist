class MarksController < ApplicationController

  before_action :correct_user, only: [:create, :destroy]
  
  def create
    book = Book.find(params[:book_id])
    current_user.mark(@book)
    flash[:success] = "お気に入り登録しました。"
    redirect_back(fallback_location: root_path)
  end

  def destroy
    book = Book.find(params[:book_id])
    current_user.unmark(@book)
    flash[:success] = "お気に入り登録を解除しました。"
    redirect_back(fallback_location: root_path)
  end

private

  def correct_user
    @book = current_user.books.find_by(id: params[:book_id])
    unless @book
      redirect_back(fallback_location: root_path)
    end
  end

end
