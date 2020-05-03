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

  def create
    @book = Book.new(book_params)
    authorize @book
    # Find author by name or create one if not in DB for each entry
    # Then create authorbook for each author relation
    @authors = params[:authors]
    @authors.each do |author_name|
      @author = Author.find_by(name: author_name)
      if @author.nil?
        @author = Author.new(name: author_name)
        @author.save
      end
      @authorbook = Authorbook.new
      @authorbook.book = @book
      @authorbook.author = @author
      @authorbook.save
    end
    if @book.save
      render :show, status: :created
    else
      render_error
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
    authorize @book # For Pundit
  end

  def book_params
    params[:published_date] = DateTime.parse(params[:published_date]["$date"])
    params.permit(:title, :isbn, :authors, :published_date, :short_description, :long_description, :thumbnail_url)

  end

  def render_error
    render json: { errors: @book.errors.full_messages },
           status: :unprocessable_entity
  end
end
