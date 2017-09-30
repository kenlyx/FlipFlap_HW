# Module that can be included (mixin) to take and output Yaml data
# Module that can be included (mixin) to take and output Yaml data
module YamlBuddy
  # takes a yaml string and converts it into a data structure in @data.
  def take_yaml(yaml)
    require 'yaml'
    @data = YAML.load(yaml)
  end

  # converts any data in @data into a yaml string.
  def to_yaml
    require 'yaml'
    yaml_string = @data.to_yaml
    return yaml_string
  end
end
