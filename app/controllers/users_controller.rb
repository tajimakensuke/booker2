class UsersController < ApplicationController

def index
  @users = User.all
  @book = Book.new
end

def show
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
end

def update
end

def destroy
end


end