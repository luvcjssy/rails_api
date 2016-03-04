if @error
  json.message @error
else
  if @book.errors.blank?
    json.message 'success'
  else
    json.message @book.errors.full_messages
  end
end
