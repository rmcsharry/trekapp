# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p1 = Employee.create(first_name: 'Michael', last_name: 'Mouse', status: :active)
p1 = Employee.create(first_name: 'Minnie', last_name: 'Mouse', status: :active)
p1 = Employee.create(first_name: 'Donald', last_name: 'Duck', status: :active)
p1 = Employee.create(first_name: 'Daffy', last_name: 'Duck', status: :active)
p1 = Employee.create(first_name: 'Donaldo', last_name: 'Duck', status: :no_longer_employed)
p1 = Employee.create(first_name: 'Renaldo', last_name: 'Duck', status: :no_longer_employed)
p1 = Employee.create(first_name: 'Ronaldo', last_name: 'Duck', status: :no_longer_employed)
p1 = Employee.create(first_name: 'Kermit', last_name: 'Le Frog', status: :unknown)
p1 = Employee.create(first_name: 'Darth "Daddy"', last_name: 'Vader', status: :standby)
p1 = Employee.create(first_name: 'Luke "Skywalker"', last_name: 'Vader', status: :standby)


