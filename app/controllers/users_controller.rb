class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show]
  
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  def destroy 
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = 'ユーザー情報は正常に削除されました'
    redirect_to("/")
  end


  def likes
    @user = User.find(params[:id])
    @marks = @user.marks.page(params[:page])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  
end