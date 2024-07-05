require './task1.rb'

class Display 
    include Cricket
    def create_team
        team = Cricket::Team.new("India", 15)
        team.add_player("Virat")
        team.add_player("Rohit")
        team.add_player("Dhoni")
        team.add_player("Rahul")
        team.add_player("Kohli")
        team.add_player("Sharma")
        team.add_player("Pant")
        team.add_player("Jadeja")
        team.add_player("Bumrah")
        team.add_player("Bhuvneshwar")
        team.add_player("Ashwin")
        p team.get_players
        p team.players_count
    end

    def create_player
        player = Cricket::Player.new("Virat")
        player.add_runs(30)
        p player.get_runs
        player.add_runs(20)
        p player.get_runs
    end

end

d = Display.new 
d.create_team
d.create_player