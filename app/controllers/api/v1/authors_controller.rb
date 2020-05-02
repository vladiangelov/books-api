class Api::V1::AuthorsController < Api::V1::BaseController
  def index
    @authors = policy_scope(Author)
  end
end
