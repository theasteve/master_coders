# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.delete_all

Proposal.delete_all

3.times {User.create!(username: Faker::Internet.user_name, password: "password", role: "faculty")}

2.times {User.create!(username: Faker::Internet.user_name, password: "password", role: "staff")}

Proposal.create!(title: Faker::RockBand.name, summary: Faker::HarryPotter.quote, hypothesis: Faker::HarryPotter.location, status: "open", requestor_id: User.first.id, experimentor_id: User.last.id)


Experiment.create!(name: "test experiment", description: "boogie", proposal: Proposal.last)


Procedure.create!(title: "Can I have your attention please?", steps: "Will the real slim shady please stand up. 2. what?", experiment: Experiment.last)
