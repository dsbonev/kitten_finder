class KittenFinder::Investigator
  def initialize(email)
    @forensics_api = KittenFinder::ForensicsApi.new email
  end

  def locate_kittens
    location = KittenFinder::Grid.new.follow_relative_directions @forensics_api.directions

    if @forensics_api.location?(location[0], location[1])
      location
    else
      raise "Location #{location} is not the correct one"
    end
  end
end
