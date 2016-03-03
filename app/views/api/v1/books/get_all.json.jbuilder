unless @books.nil?
  json.array! @books do |book|
    json.partial! book
  end
else
  json.message 'Not found books'
end