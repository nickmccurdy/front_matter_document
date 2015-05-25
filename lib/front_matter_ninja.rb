require 'front_matter_ninja/version'

require 'safe_yaml/load'

class FrontMatterNinja
  attr_accessor :data, :content

  DOCUMENT_MATCHER = /\A(---\s*\n.*?\n?)^((---|\.\.\.)\s*$\n?)(.*)/m
  YAML_START_MATCHER = /\A---\s*/
  YAML_END_MATCHER = /\.\.\.\n\z/

  def initialize(string)
    match = string.match DOCUMENT_MATCHER

    @data = SafeYAML.load(match[0]) || {} if match
    @content = match ? match[4] : string
  end

  def raw_data
    strip_yaml @data.to_yaml
  end

  def raw_data=(data)
    @data = SafeYAML.load(data) || {}
  end

  def to_s
    "---\n#{raw_data}---\n\n#{content}"
  end

  private

  def strip_yaml(string)
    string.sub(YAML_START_MATCHER, '').sub(YAML_END_MATCHER, '')
  end
end
