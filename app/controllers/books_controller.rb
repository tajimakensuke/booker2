class BooksController < ApplicationController
  before_action :authenticate_user!,except: [:top]

  before_action :baria_user, only: [:edit, :destroy, :update]

def new
end

def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @user = current_user

    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      render action: :index
    end
end

def index
    @user = current_user
    @book = Book.new
    @books = Book.all
end

def show
    @book = Book.find(params[:id])
    @user = User.find_by(id: @book.user_id)
end

def edit
  @book = Book.find(params[:id])
end

def update
  @book = Book.find(params[:id])

  if @book.update(book_params)
    flash[:notice] = "You have updated book successfully."
    redirect_to book_path(@book.id)
  else
    render action: :edit
  end
end

def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
end

 private

def user_params
  params.require(:user).permit(:name, :profile_image)
end
def book_params
  params.require(:book).permit(:title, :body)
end

def baria_user
  unless Book.find(params[:id]).user.id.to_i == current_user.id
  redirect_to books_path
  end
end

end