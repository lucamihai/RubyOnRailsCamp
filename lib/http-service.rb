require 'faraday'
require 'faraday/net_http'
require 'json'

module HttpService
  def self.get(uri)
    response = Faraday.get(uri)
    exitIfNotOk(response)
    JSON.parse(response.body)
  end

  private
  def self.exitIfNotOk(response)
    if response.status != 200
      puts "Error, got status #{response.status}"
      exit(false)
    end
  end
end
