if @error
  json.message @error
else
  if @author.errors.blank?
    json.message 'success'
  else
    json.message @author.errors.full_messages
  end
end
