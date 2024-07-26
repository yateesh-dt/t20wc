# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
10.times do |i|
  Team.create!(
    name: "Team #{i + 1}",
    country: ["India", "Australia", "England", "South Africa", "New Zealand"].sample,
    founded: rand(1901..2021),
    description: "This is the description for Team #{i + 1}",
    player_count: 0
  )
end

team_ids = Team.pluck(:id)

30.times do |i|
  Player.create!(
    name: "Player #{i + 1}",
    age: rand(18..40),
    position: ["Slips", "Gully", "Point", "Wicket Keeper", "Third Man", "Square Leg", "Fine Leg", "Mid-Wicket", "Mid Off", "Mid On", "Long Off", "Long On"].sample,
    team_id: team_ids.sample,
    role: ["allrounder", "bowler", "batsman"].sample,
    description: "This is the description for Player #{i + 1}"
  )
end

team_ids = Team.pluck(:id)

15.times do |i|
  team1_id, team2_id = team_ids.sample(2)

  Match.create!(
    location: "Location #{i + 1}",
    date: Date.today + i.days,
    team1_id: team1_id,
    team2_id: team2_id
  )
end