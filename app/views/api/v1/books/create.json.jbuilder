unless @book.nil?

  if @error
    json.errors @error
  else
    if @result
      json.extract! @book, :id, :title, :description, :created_at, :updated_at, :author
    else
      json.errors @book.errors.full_messages
    end
  end

else
  json.errors 'Data is null!'
end