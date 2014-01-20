
module Coffee
  
  class Cli < Thor
    desc "on", "start coffee maker"
    def on
      Coffee::Remote.on
      Coffee::Remote.print_status
    end

    desc "off", "stop coffee maker"
    def off
      Coffee::Remote.off
      Coffee::Remote.print_status
    end

    desc "status", "show info about coffee maker"
    def status
      Coffee::Remote.print_status
    end

    desc "message", "show message on coffee maker lcd"
    def message(content)
      Coffee::Remote.message(content)
    end

    desc "config", "config coffee maker for specified url ex. coffee config http://coffee.com"
    def config(url)
      puts "Configuring..."
      config = JSON.parse(HTTParty.get(File.join(url, "/coffee/config")).parsed_response)
      if ["login", "password", "host"].any? {|k| config.key?(k)}
        File.open(Coffee::Config.path, 'w') {|f| f.write config.to_yaml }
        puts "Success! Saving config in #{Coffee::Config.path.inspect}"
      else
        puts "Invalid response"
      end
    end
  end

end
