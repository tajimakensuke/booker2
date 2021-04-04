class UsersController < ApplicationController
  before_action :authenticate_user!,except: [:top]

  before_action :baria_user, only: [:edit, :update]

def index
  @users = User.all
  @book = Book.new
  @user = current_user
end

def show
  @user = User.find(params[:id])
  @books = @user.books
  @book = Book.new

end

def create
  @book = Book.new(book_params)
  @book.user_id = current_user.id
  @user = current_user

    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      render  action: :create
    end
end

def edit
  @user = User.find(params[:id])
end

def update
  @user = current_user

  if @user.update(user_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user.id)
  else
    render action: :edit
  end
end

def destroy
end

private

def user_params
  params.require(:user).permit(:name, :profile_image, :introduction)
end
def book_params
  params.require(:book).permit(:title, :body)
end

def baria_user
  unless User.find(params[:id]) == current_user
  redirect_to user_path(current_user.id)
  end
end


end