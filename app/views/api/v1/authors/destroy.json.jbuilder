  if @error
    json.message @error
  else
    json.message 'success'
  end
