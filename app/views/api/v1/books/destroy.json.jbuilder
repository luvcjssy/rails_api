unless @book.nil?

  if @error
    json.message @error
  else
    if @result
      json.message 'success'
    else
      json.message @book.errors.full_messages
    end
  end

else
  json.message 'Data delete is null!'
end