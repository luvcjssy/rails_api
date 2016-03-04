if @error
  json.errors @error
else
  if @book.errors.blank?
    json.partial! @book
  else
    json.errors @book.errors.full_messages
  end
end
