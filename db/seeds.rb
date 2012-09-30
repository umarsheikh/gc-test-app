# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Creating default roles."

ActiveRecord::Base.connection.execute("TRUNCATE roles; SELECT setval('roles_id_seq', 1, false);")
Role.create(id: 1, name: 'Agency Admin',  description: 'Agency admin')
Role.create(id: 2, name: 'Agency User',   description: 'Agency user')
Role.create(id: 3, name: 'Account Owner', description: 'Account owner')
Role.create(id: 4, name: 'Participant',   description: 'Participant')

puts "Creating default states."

ActiveRecord::Base.connection.execute("TRUNCATE states; SELECT setval('states_id_seq', 1, false);")
states = [{:abbr => "AL", :name => "Alabama"}, {:abbr => "AK", :name => "Alaska"}, {:abbr => "AZ", :name => "Arizona"}, {:abbr => "AR", :name => "Arkansas"}, {:abbr => "CA", :name => "California"}, {:abbr => "CO", :name => "Colorado"}, {:abbr => "CT", :name => "Connecticut"}, {:abbr => "DE", :name => "Delaware"}, {:abbr => "DC", :name => "District of Columbia"}, {:abbr => "FL", :name => "Florida"}, {:abbr => "GA", :name => "Georgia"}, {:abbr => "HI", :name => "Hawaii"}, {:abbr => "ID", :name => "Idaho"}, {:abbr => "IL", :name => "Illinois"}, {:abbr => "IN", :name => "Indiana"}, {:abbr => "IA", :name => "Iowa"}, {:abbr => "KS", :name => "Kansas"}, {:abbr => "KY", :name => "Kentucky"}, {:abbr => "LA", :name => "Louisiana"}, {:abbr => "ME", :name => "Maine"}, {:abbr => "MD", :name => "Maryland"}, {:abbr => "MA", :name => "Massachusetts"}, {:abbr => "MI", :name => "Michigan
"}, {:abbr => "MN", :name => "Minnesota"}, {:abbr => "MS", :name => "Mississippi"}, {:abbr => "MO", :name => "Missouri"}, {:abbr => "MT", :name => "Montana"}, {:abbr => "NE", :name => "Nebraska"}, {:abbr => "NV", :name => "Nevada"}, {:abbr => "NH", :name => "New Hampshire"}, {:abbr => "NJ", :name => "New Jersey"}, {:abbr => "NM", :name => "New Mexico"}, {:abbr => "NY", :name => "New York"}, {:abbr => "NC", :name => "North Carolina"}, {:abbr => "ND", :name => "North Dakota"}, {:abbr => "OH", :name => "Ohio"}, {:abbr => "OK", :name => "Oklahoma"}, {:abbr => "OR", :name => "Oregon"}, {:abbr => "PA", :name => "Pennsylvania"}, {:abbr => "RI", :name => "Rhode Island"}, {:abbr => "SC", :name => "South Carolina"}, {:abbr => "SD", :name => "South Dakota"}, {:abbr => "TN", :name => "Tennessee"}, {:abbr => "TX", :name => "Texas"}, {:abbr => "UT", :name => "Utah"}, {:abbr => "VT", :name => "Vermont"}, {:abbr => "VA", :name => "Virginia"}, {:abbr => "WA", :name => "Washington"}, {:abbr => "WV", :name => "West Virginia"}, {:abbr => "WI", :name => "Wisconsin"}, {:abbr => "WY", :name => "Wyoming"}]

states.each_with_index do |item, index|
  State.create(id: index, name: item[:name], abbr: item[:abbr])
end

agency = Agency.create!(id: 1, name: 'My Agency')
User.create!(id: 1, first_name: 'Jhon', last_name: 'Doe', email: 'jhon@doe.com', agency_id: agency.id, role_id: 1)
Trip.create!(id: 1, name: 'Trip1', destination: 'London', group_name: 'Group1')

puts "Done!"