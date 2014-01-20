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
      puts "Running: #{stats["running"].inspect}"
      puts "Seconds: #{stats["uptime"].inspect}"
    end

  end
end