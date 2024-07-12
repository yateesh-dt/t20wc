require './config/environment.rb'

# Retrieve all players of a specific team.

players_in_team1 = Player.where(team_id: 1)
puts "Players from team 1"
players_in_team1.each do |p|
    puts p.name
end

# Retrieve players older than a certain age.

players_below_25 = Player.where("age > ?", 25)
players_below_25.each do |p|
    puts "#{p.name} is below 25"
end

# List all players and their corresponding teams.

players_and_teams = Player.select(:name, :team_id)
players_and_teams.each do |p|
    puts "#{p.name} belonsg to team#{p.team_id}"
end

# Insert a new player into a team.

player = Player.new(name: "Yateesh", age: 23, position:"Defender", team_id: 7)
player.save

# Update a player's position.
player_yateesh = Player.find_by(name:"Yateesh")
player_yateesh.update(position:"Forward")
player_yateesh_updated =  Player.find_by(name:"Yateesh")
puts player_yateesh_updated.position

# Delete a player by their name.

player_yateesh = Player.find_by(name:"Yateesh")
player_yateesh.destroy

# Get the count of players in each team including teams without any players

teamwise_players_count = Team.left_joins(:players).group(:id).count(:team_id)
teamwise_players_count.each do|twc|
    puts "Team #{twc[0]} has #{twc[1]} players"
end

# Retrieve matches along with the names of both teams.
matches_with_teams = Match.select('team1_id, team2_id')
matches_with_teams.each do|m|
    puts "Match between team #{m.team1_id} and team #{m.team2_id}"
end

# Filter teams with more than a certain number of players
teams_more_than_3players = Player.select('team_id, COUNT(*) as player_count').group(:team_id).having('player_count > 3')
teams_more_than_3players.each do |p|
    puts "Team #{p.team_id} has #{p.player_count} players"
end

# Retrieve the average age of players in each team.
teamwise_players_average_age = Player.select('team_id, AVG(age) as average_age').group(:team_id)
teamwise_players_average_age.each do |p|
    puts "Team #{p.team_id} has average age of #{p.average_age}"
end



