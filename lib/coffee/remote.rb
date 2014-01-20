module Coffee
  class Remote
    include HTTParty
    
    def self.message(content)
      get(Coffee::Config.url("/coffee/message"), basic_auth: Coffee::Config.basic, body: { message: content })
    end

    def self.on
      get(Coffee::Config.url("/coffee/on"), basic_auth: Coffee::Config.basic)
    end

    def self.off
      get(Coffee::Config.url("/coffee/off"), basic_auth: Coffee::Config.basic)
    end

    def self.status
      JSON.parse(get(Coffee::Config.url("/coffee/about"), basic_auth: Coffee::Config.basic).parsed_response)
    end

    def self.print_status
      stats = self.status
      
      total_seconds = stats["uptime"]
      seconds       = total_seconds % 60
      minutes       = (total_seconds / 60) % 60
      hours         = total_seconds / (60 * 60)

      uptime = "%02d:%02d:%02d" % [hours, minutes, seconds]

      puts "Running: #{stats["running"].inspect}"
      puts "Uptime: #{uptime}"


    end

  end
end