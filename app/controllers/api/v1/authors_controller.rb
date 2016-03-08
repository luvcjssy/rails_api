class Api::V1::AuthorsController < API::V1::V1Controller
  before_action :set_author, only: [:show, :update, :destroy]

  def index
    @authors = Author.status
  end

  def show
  end

  def create
    @author = Author.new(author_params)
    begin
      @author.save
    rescue Exception => e
      @error = e.message
    end
  end

  def update
    begin
      @author.update_attributes(author_params)
    rescue Exception => e
      @error = e.message
    end
  end

  def destroy
    begin
      @author.destroy
    rescue Exception => e
      @error = e.message
    end
  end

  private

  def set_author
    @author = Author.find(params[:id])
  end

  def author_params
    params.require(:author).permit(:full_name, :birthday, :email, :phone, :status)
  end
end
