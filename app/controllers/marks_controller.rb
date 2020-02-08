class MarksController < ApplicationController
  
  
  def create
    book = Book.find(params[:book_id])
    current_user.mark(book)
    flash[:success] = "お気に入り登録しました。"
    redirect_back(fallback_location: root_path)
  end

  def destroy
    book = Book.find(params[:book_id])
    current_user.unmark(book)
    flash[:success] = "お気に入り登録を解除しました。"
    redirect_back(fallback_location: root_path)
  end

end
