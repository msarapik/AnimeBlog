module AppConfig
  def self.[](key)
    file = YAML.load_file('config/app-config.yml')
    file[RAILS_ENV][key.to_s] || {}
  end
end
