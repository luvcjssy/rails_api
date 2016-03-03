class Api::V1::BooksController < API::V1::V1Controller
  before_action :set_book, only: [:show, :update, :destroy]

  def index
    @author = Author.find(params[:author_id])
    @books = @author.books
  end

  def get_all
    @books = Book.all
  end

  def show
  end

  def create
    unless params[:book].nil?
      @book = Book.new(book_params)
      begin
        @result = @book.save
      rescue Exception => e
        @error = e.message
      end
    end
  end

  def update
    begin
      @result = @book.update_attributes(book_params)
    rescue Exception => e
      @error = e.message
    end
  end

  def destroy
    begin
      @result = @book.destroy
    rescue Exception => e
      @error = e.message
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :description, :author_id)
  end


end
