require 'rubygems'
require 'mqtt'
require 'dotenv'
Dotenv.load('.env')
#client = MQTT::Client.connect(:host => 'localhost', :port => 1883, :username => 'admin', :password => '123456')

### Publish###
puts "####{ENV["MQTTS_ENDPOINT"]}"

client = MQTT::Client.connect(
  :host => ENV["MQTTS_ENDPOINT"],
  :username => ENV["MQTTS_USERNAME"],
  :password => ENV["MQTTS_PASSWORD"],
  :ssl => true,
  :port => ENV["PORT"]
)

  # client = MQTT::Client.connect(
  #   :host => 'mqtt.iade-iot.eu',
  #   :port => 1883
  # )


  client.publish('jcalapez/hello', 'Hello')
  client.disconnect
#####


### Subscribe###
# client.subscribe( 'jcalapez/teste' )

# client.get do |topic,message|
#   puts "#{topic}: #{message}"
# end

#####

  # client = MQTT::Client.connect(
  #   host: "mqtt.eclipseprojects.io", # Your AWS IoT host
  #   port: 1883 ,
  #   )
    # - "9001:9001"
    # - "8883:8883"


####### PROBLEMA ESTA NO SERVIDOR MQTT!!!!!!!!!!!

#   mosquitto_pub -h 'broker.emqx.io' -t 'test' -m 'Hello World'

  
# Publish example
# client do |c|
#   10.times do
#     puts "Publishing message"
#     c.publish('actuator/jcalapez/pI85EsccaRyZ3w0oBndgS9k9jtC0bS5R', 'TESTE_TESTE')
#   end
# end

# # Subscribe example
# MQTT::Client.connect('test.mosquitto.org') do |c|
#   # If you pass a block to the get method, then it will loop
#   c.get('test') do |topic,message|
#     puts "#{topic}: #{message}"
#   end
# end
## mosquitto_sub -t 'teste/teste' -p 1883 -u 'mosquitto' -P '123456' -d


## user: mosquitto
## password: 123456