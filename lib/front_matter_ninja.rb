require 'front_matter_ninja/version'

require 'safe_yaml'

module FrontMatterNinja
  def self.parse(string)
    match = string.match(/\A(---\s*\n.*?\n?)^((---|\.\.\.)\s*$\n?)/m)

    if match && match[0]
      SafeYAML.load(match[0]) || {}
    else
      nil
    end
  end
end
