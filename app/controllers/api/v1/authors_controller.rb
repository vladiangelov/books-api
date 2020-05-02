class Api::V1::AuthorsController < Api::V1::BaseController
  before_action :set_author, only: [ :show ]

  def index
    @authors = policy_scope(Author)
  end

  def show
    @books = []
    @author.books.each do |book|
      @books << book.title
    end
    @books
  end

  private

  def set_author
    @author = Author.find(params[:id])
    authorize @author # For Pundit
  end
end
