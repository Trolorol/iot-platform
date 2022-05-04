module DevicesHelper
  # client = MQTT::Client.connect(
  #   :host => ENV["MQTTS_ENDPOINT"],
  #   :username => ENV["MQTTS_USERNAME"],
  #   :password => ENV["MQTTS_PASSWORD"],
  #   :ssl => true,
  #   :port => ENV["PORT"]
  # )



  # client.publish('jcalapez/teste', 'Hello')
  # client.disconnect

  # client.subscribe( 'jcalapez/teste' )

  # client.get do |topic,message|
  #   puts "#{topic}: #{message}"
  # end

  def self.publish(topic, message)
    @client = Mqtt::Connection.init
    @client.publish(topic, message)
    @client.disconnect
  end

  def self.subscribe(topic)
    @client = Mqtt::Connection.init
    @client.subscribe(topic)
    @client.disconnect
  end

  def self.get
    @client = Mqtt::Connection.init
    @client.get do |topic, message|
      puts "#{topic}: #{message}"
    end
    @client.disconnect
  end
end
