module Mqtt
    class Connection
      def self.init
        @client = MQTT::Client.connect(
            :host => ENV["MQTTS_ENDPOINT"],
            :username => ENV["MQTTS_USERNAME"],
            :password => ENV["MQTTS_PASSWORD"],
            :ssl => true,
            :port => ENV["MQTTS_PORT"]
          )
        @client
      end
    end
  end