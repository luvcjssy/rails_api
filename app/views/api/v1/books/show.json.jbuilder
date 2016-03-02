unless @book.nil?
  json.book do
    json.partial! @book
  end
else
  json.message 'Not found books'
end