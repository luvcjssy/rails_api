if @error
  json.message @error
else
  if @author.errors.blank?
    json.partial! @author
  else
    json.message @author.errors.full_messages
  end
end