class ApplicationController < ActionController::API

    URL = "https://pokeapi.co/api/v2/"

    def api_call(extra)
        uri = URI(URL + "#{extra}")
        response = Net::HTTP.get_response(uri)
        json_response = JSON.parse(response.read_body)
    end
end
