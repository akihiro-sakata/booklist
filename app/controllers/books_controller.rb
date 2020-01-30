class BooksController < ApplicationController
before_action :require_user_logged_in
before_action :correct_user, only: [:show, :edit, :update, :destroy]


  def index
      @books = current_user.books.order(created_at: :desc).page(params[:page]).per(10)
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = current_user.books.build(book_params)

    if @book.save
      flash[:success] = '本は正常に登録されました'
      redirect_to @book
    else
      flash.now[:danger] = '本が投稿されませんでした'
      render :new
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      flash[:success] = '本は正常に更新されました'
      redirect_to @book
    else
      flash.now[:danger] = '本が更新されませんでした'
      render :edit
    end
  end

  def destroy
    @book.destroy

    flash[:success] = '本は正常に削除されました'
    redirect_to books_url
  end

  private

  # Strong Parameter
  
  def book_params
    params.require(:book).permit(:category, :title, :content)
  end
  
  def correct_user
    @book = current_user.books.find_by(id: params[:id])
    unless @book
      redirect_to root_url
    end
  end
end
