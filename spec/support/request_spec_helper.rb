module RequestSpecHelper
  def body_json
    JSON.parse(response.body, object_class: OpenStruct)
  rescue
    return {}
  end
end