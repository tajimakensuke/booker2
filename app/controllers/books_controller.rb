class BooksController < ApplicationController

def new
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
  @book.update(book_params)
    redirect_to book_path
end

def destroy
   PostComment.find_by(id: params[:id], post_image_id: params[:post_image_id]).destroy
   redirect_to post_image_path(params[:post_image_id])
end

 private

def user_params
  params.require(:user).permit(:name, :profile_image)
end
def book_params
  params.require(:book).permit(:book_title, :opinion)
end

end