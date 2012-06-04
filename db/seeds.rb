require "yaml"

yml = YAML.load_file(File.expand_path("../events.yml", __FILE__))

yml.each do |entry|
  label  = entry[0]
  detail = entry[1]

  puts "Importing %s ..." % label

  parameters = {
    :label                 => label,
    :name                  => detail["name"],
    :description           => detail["description"],
    :url                   => detail["url"],
    :turnout               => detail["turnout"],
    :place                 => detail["place"],
    :address               => detail["address"],
    :start_at              => detail["start_at"],
    :end_at                => detail["end_at"] || detail["start_at"],
    :cover_url             => detail["cover_url"],
    :cover_original_url    => detail["cover_original_url"],
    :cover_original_author => detail["cover_original_author"]
  }

  Event.create(parameters)
end
