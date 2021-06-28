class UsersController < ApplicationController
  before_action :ensure_correct_user, {only: [:edit, :update]}
    def index
      @newbook = Book.new
      @user = current_user
      @users = User.all
    end
    
    def show
      @newbook = Book.new
      @user = User.find(params[:id])
      @user_books = @user.books
    end
    
    def edit
      @user = User.find(params[:id])
    end
    
    def update
      user = User.find(params[:id])
      user.update(user_params)
      redirect_to user_path(current_user)
    end
    
    private 
    def user_params
      params.require(:user).permit(:name, :introduction, :profile_image)
    end
    
    def ensure_correct_user
      if current_user.id != params[:id].to_i
        redirect_to user_path(current_user)
      end
    end
end
