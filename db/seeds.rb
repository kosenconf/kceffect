require "yaml"

yml = YAML.load_file(File.expand_path("../events.yml", __FILE__))

yml.each do |entry|
  label  = entry[0]
  detail = entry[1]

  puts "Importing %s ..." % label

  parameters = {
    :label       => label,
    :name        => detail["name"],
    :description => detail["description"],
    :url         => detail["url"],
    :turnout     => detail["turnout"],
    :place       => detail["place"],
    :address     => detail["address"],
    :start_at    => detail["date"],
    :end_at      => detail["date"]
  }

  Event.create(parameters)
end
