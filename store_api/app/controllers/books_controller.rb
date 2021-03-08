class BooksController < ApplicationController
    def index
        @books = Book.all
        render json: @books
    end
    
    def show
        @book = Book.find(params[:id])
        render json: @book
    end
      
    def create
        @book = Book.new(book_params)
        
        if @book.save
            render json: @book
        else
            render json: {error: "Could not create book"}
        end
    end
    
    def update
        @book = Book.find(params[:id])
        
        if @book.update(book_params)
            render json: @book
        else
            render json: {error: "Could not update book"}
        end
    end
    
    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        
        @books = Book.all
        render json: @books
    end
    
    private
    def book_params
        params.require(:book).permit(:name, :price, :description, :category, :author, :company_id)
    end

end
