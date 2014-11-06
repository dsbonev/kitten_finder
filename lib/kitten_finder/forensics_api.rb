require 'json'
require 'open-uri'

class KittenFinder::ForensicsApi
  BASE_URL = 'http://which-technical-exercise.herokuapp.com/'.freeze

  def initialize(email)
    @email = email
  end

  def directions
    fetch_resource("api/#{@email}/directions")['directions']
  end

  def location?(x, y)
    response = fetch_resource("api/#{@email}/location/#{x}/#{y}")
    response['message'].include? 'Congratulations'
  end

  private

  def fetch_resource(path)
    JSON.parse open("#{BASE_URL}#{path}").read
  end
end
