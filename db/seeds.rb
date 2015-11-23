# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

Administrator.create(email: "admin@studyadvisor.fr", password: "studyadvisor", password_confirmation: "studyadvisor")
CSV.foreach(Rails.root.to_s + '/Etablissement_All_v2.csv') do |row|
	Etablissement.create(name: row[1])
end
