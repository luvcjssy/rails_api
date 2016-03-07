class Api::V1::BooksController < API::V1::V1Controller
  before_action :set_book, only: [:show, :update, :destroy]

  def index
    @author = Author.find(params[:author_id])
    @books = @author.books.published
  end

  def get_all
    @books = Book.published
  end

  def show
  end

  def create
    @book = Book.new(book_params)
    begin
      @book.save
    rescue Exception => e
      @error = e.message
    end
  end

  def update
    begin
      @book.update_attributes(book_params)
    rescue Exception => e
      @error = e.message
    end
  end

  def destroy
    begin
      @book.destroy
    rescue Exception => e
      @error = e.message
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :description, :author_id, :published)
  end


end
