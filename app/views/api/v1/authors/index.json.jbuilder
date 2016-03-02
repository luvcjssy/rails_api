unless @authors.nil?
  json.array! @authors do |author|
    json.partial! author
  end
else
  json.message 'Not found author'
end