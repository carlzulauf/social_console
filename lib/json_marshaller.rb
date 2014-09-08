class JsonMarshaller
  def load(json)
    JSON.parse(json)
  rescue
    {}
  end

  def dump(data)
    data.to_json
  end
end
