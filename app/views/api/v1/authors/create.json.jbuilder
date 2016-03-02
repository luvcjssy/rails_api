unless @author.nil?

  if @error
    json.errors @error
  else
    if @result
      json.extract! @author, :id, :full_name, :birthday, :email, :phone, :created_at, :updated_at
    else
      json.errors @author.errors.full_messages
    end
  end

else
  json.errors 'Data update is null!'
end