module Cricket 
    class Team 
        def initialize(name, size)
            @size = size
            @name = name
            @players = []
        end

        def add_player(player)
            @players.append(player)
        end

        def remove_player(player)
            @player.remove(player)
        end

        def get_players
            @players
        end

        def players_count
            @players.count
        end
    end

    class Player 
        def initialize(name)
            @name = name
            @runs = 0
            @wickets = 0
        end

        def add_runs(runs)
            @runs += runs 
        end

        def add_wickets(wickets)
            @wickets += wickets 
        end

        def get_runs
            @runs
        end

        def get_wickets
            @wickets
        end
    end


end
    

