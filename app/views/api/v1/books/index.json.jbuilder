json.key_format! camelize: :lower
json.array! @books do |book|
  json.extract! book, :id, :title
end
