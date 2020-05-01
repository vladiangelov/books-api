class Api::V1::BooksController < Api::V1::BaseController
  before_action :set_book, only: [ :show ]

  def index
    @books = policy_scope(Book)
  end

  def show
    @authors = []
    @book.authors.each do |author|
      @authors << author.name
    end
    @authors
  end

  private

  def set_book
    @book = Book.find(params[:id])
    authorize @book # For Pundit
  end
end
