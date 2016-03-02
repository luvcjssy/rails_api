unless @author.nil?
  json.author do
    json.partial! @author
  end
else
  json.message 'Not found author'
end