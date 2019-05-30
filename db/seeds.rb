# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Customer.create(name: 'daniel', email: 'dan@daniel.com', phone: '2134213')
Customer.create(name: 'maul', email: 'maul@maul.com', phone: '2134213')
Customer.create(name: 'hans', email: 'hans@hans.com', phone: '2134213')

location1 = Location.create(name: 'Pasaraya Blok M', address: 'Jl. Thamrin', longitude: 1.2, latitude: 2.2)
location2 = Location.create(name: 'Blok M Square', address: 'Jl. Thamrin', longitude: 2.2, latitude: 2.2)
location3 = Location.create(name: 'Blok M Plaza', address: 'Jl. Thamrin', longitude: 3.2, latitude: 2.2)

location1.events.create(description: 'Ruby meet up', origanizer: 'Gojek', start_date: '2013-02-02 01:00:00', end_date: '2013-02-02 01:00:00')
location2.events.create(description: 'Java meet up', origanizer: 'Bukalapak', start_date: '2013-02-03 01:00:00', end_date: '2013-02-03 01:00:00', location_id: 2)
location3.events.create(description: 'PHP meet up', origanizer: 'Tokopedia', start_date: '2013-02-04 01:00:00', end_date: '2013-02-04 01:00:00', location_id: 3)

Ticket.create(category: 'Economy', price: 10000, quota: 10, event_id: 1)
Ticket.create(category: 'Premium', price: 15000, quota: 10, event_id: 1)
Ticket.create(category: 'Economy', price: 10000, quota: 10, event_id: 2)
Ticket.create(category: 'Premium', price: 15000, quota: 10, event_id: 2)
Ticket.create(category: 'Economy', price: 10000, quota: 10, event_id: 3)

transaction = TicketTransaction.create(customer_id: 1)

transaction.ticket_purchases.create(ticket_id: 1, amount: 1)
