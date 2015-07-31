class ServiceList

  def deliver(format, response)
    return not_implemented_yet(response) unless format == :json
    response.tap { |res| res.body = json_payload }
  end

  private

  def not_implemented_yet(response)
    response.tap { |res| res.status = :not_implemented }
  end

  def json_payload
    JSON.generate(services: Service.all.to_json)
  end
end
