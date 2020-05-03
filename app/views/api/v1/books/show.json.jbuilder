json.key_format! camelize: :lower
json.extract! @book, :id, :title, :isbn, :short_description, :long_description, :thumbnail_url
json.authors @authors
json.published_date do
  json.set! "$date", @book.published_date
end
