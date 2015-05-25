require 'front_matter_ninja/version'

require 'safe_yaml/load'

class FrontMatterNinja
  attr_accessor :data, :content

  def initialize(string)
    match = string.match(/\A(---\s*\n.*?\n?)^((---|\.\.\.)\s*$\n?)(.*)/m)

    @data = SafeYAML.load(match[0]) || {} if match
    @content = match ? match[4] : string
  end

  def raw_data
    @data.to_yaml
         .sub(/\A---\s*/, '')
         .sub(/\.\.\.\n\z/, '')
  end

  def raw_data=(data)
    @data = SafeYAML.load(data) || {}
  end
end
