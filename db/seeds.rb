# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Year.create(value: "#{Time.now.year}-#{Time.now.year + 1}")
Genre.create([{value: "Informatique"},{value: "Mathématique"},{value: "Économie"}, {value: "Formation Humaine"}])
Lieu.create([{value: "Evry"}, {value: "Strasbourg"}, {value: "Evry + Strasbourg"}])