if @error
  json.message @error
else
  if @book.errors.blank?
    json.partial! @book
  else
    json.message @book.errors.full_messages
  end
end
