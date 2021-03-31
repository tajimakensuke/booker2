class UsersController < ApplicationController

def index
  @users = User.all
  @book = Book.new
end

def show
  @user = User.find(params[:id])
  @books = @user.books
end

def create
  @book = Book.new(book_params)
  @book.user_id = current_user.id

    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to books_path
    else
      render action: :index
    end
end

def edit
  @user = current_user
end

def update
  @user = current_user
  @user.update(user_params)
    redirect_to user_path(@user.id)
end

def destroy
end

private

def user_params
  params.require(:user).permit(:name, :profile_image, :introduction)
end


end