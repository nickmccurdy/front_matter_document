require 'front_matter_ninja/version'

require 'safe_yaml/load'

class FrontMatterNinja
  attr_accessor :data

  def initialize(string)
    match = string.match(/\A(---\s*\n.*?\n?)^((---|\.\.\.)\s*$\n?)/m)

    @data = SafeYAML.load(match[0]) || {} if match
  end
end
