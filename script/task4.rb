require 'csv'

class Cricket
    def process_data(path)
        @data = CSV.read(path, headers: true).map(&:to_h).map do |row|
            {
            'name' => row['Player_name'],
            'runs' => row['Runs_scored'].to_i,
            'balls' => row['Balls_faced'].to_i,
            'fours' => row['Number_of_fours'].to_i,
            'sixes' => row['Number_of_sixes'].to_i
            }
        end
        @data
    end

    def display_data(path)
        @data = process_data(path)

        @data.each do |player|
            sr = (player['runs'].to_f / player['balls'].to_f) * 100
            puts "Strike rate of #{player['name']} is #{sr}"
        end

        highest_sr = @data.select { |player| player['balls'].to_f > 0 }.
                    max_by { |player| (player['runs'].to_f / player['balls'].to_f) * 100 }
        puts "Player with highest strike rate is #{highest_sr['name']}"

        total_runs = @data.sum { |player| player['runs'] }
        puts "Total runs scored by all players is #{total_runs}"

        total_balls = @data.sum { |player| player['balls'] }
        puts "Total balls faced by all players is #{total_balls}"

        highest_fours = @data.max_by { |player| player['fours'] }
        puts "Player with most fours is #{highest_fours['name']} with #{highest_fours['fours']} fours"

        highest_sixes = @data.max_by { |player| player['sixes'] }
        puts "Player with most sixes is #{highest_sixes['name']} with #{highest_sixes['sixes']} sixes"
    end 
end 

cricket = Cricket.new 
cricket.display_data('data/cricket_stats.csv')


