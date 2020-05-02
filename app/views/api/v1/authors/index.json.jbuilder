json.key_format! camelize: :lower
json.array! @authors do |author|
  json.extract! author, :id, :name
end
