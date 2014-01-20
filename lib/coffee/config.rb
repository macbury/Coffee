module Coffee
  class Config

    def self.get(key)
      self.shared[key]
    end

    def self.basic
      {:username => get("login"), :password => get("password") }
    end

    def self.url(path)
      File.join(get("host"), path)
    end

    def self.shared
      @shared ||= YAML::load(File.open(self.path))
    end

    def self.path
      File.join(File.expand_path(Dir.home), ".coffee")
    end
  end
end