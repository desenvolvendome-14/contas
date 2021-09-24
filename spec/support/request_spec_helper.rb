# frozen_string_literal: true

module RequestSpecHelper
  def body_json
    JSON.parse(response.body, object_class: OpenStruct)
  rescue StandardError
    {}
  end
end
