unless @author.nil?

  if @error
    json.message @error
  else
    if @result
      json.message 'success'
    else
      json.message @author.errors.full_messages
    end
  end

else
  json.message 'Data update is null!'
end