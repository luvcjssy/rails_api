if @error
  json.errors @error
else
  if @author.errors.blank?
    json.partial! @author
  else
    json.errors @author.errors.full_messages
  end
end
