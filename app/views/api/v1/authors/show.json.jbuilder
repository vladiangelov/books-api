json.key_format! camelize: :lower
json.extract! @author, :id, :name
json.books @books
