module DevicesHelper
  @client = MQTT::Client.connect(
    host: 'localhost',
    username: 'admin',
    password: '123456',
    ssl: false,
    port: 1883
  )

  # client.publish('jcalapez/teste', 'Hello')
  # client.disconnect

  # client.subscribe( 'jcalapez/teste' )

  # client.get do |topic,message|
  #   puts "#{topic}: #{message}"
  # end

  def self.publish(topic, message)
    @client.publish(topic, message)
  end

  def self.subscribe(topic)
    @client.subscribe(topic)
  end

  def self.get
    @client.get do |topic, message|
      puts "#{topic}: #{message}"
    end
  end
end
