# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


TriggerType.create([{name: "switch"}, {name: "sensor"}])
Trigger.create([{name: "simple_light", trigger_type_id: 1}, {name: "rgb_light", trigger_type_id: 1}, {name: "temp_sensor", trigger_type_id: 2}])