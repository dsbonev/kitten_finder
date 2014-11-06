module KittenFinder
  require "kitten_finder/forensics_api"
  require "kitten_finder/grid"
  require "kitten_finder/investigator"
  require "kitten_finder/version"

  def self.investigator(email)
    Investigator.new email
  end
end
