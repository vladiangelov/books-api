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

  def create
    @author = Author.new(author_params)
    authorize @author
    if @author.save
      render :show, status: :created
    else
      render_error
    end
  end

  private

  def set_author
    @author = Author.find(params[:id])
    authorize @author # For Pundit
  end

  def author_params
    params.require(:author).permit(:name)
  end

  def render_error
    render json: { errors: @author.errors.full_messages },
           status: :unprocessable_entity
  end
end
