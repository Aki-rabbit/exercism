class Tournament
    GRANTED_POINTS = {
        "win" => 3,
        "draw" => 1,
        "loss" => 0,
    }.freeze 

    def self.tally(input)
        read_input_data = self.read_input(input) 
        team_data = self.create_tournament_data(read_input_data)
        self.format_data(team_data)
    end

    #インプット読み取り 
    def self.read_input(input)
        return [] if input.strip.empty?
        
        input.strip.split("\n").map do |line|
            team1, team2, status = line.split(";")
            { team1: team1, team2: team2, status: status}
        end
    end

    #順位表作成
    def self.create_tournament_data(read_input) 
        team_data = Hash.new { |hash, key| hash[key] = { mp: 0, w: 0, d: 0, l: 0, p: 0 } }
    
        read_input.each do |match|
            team1 = match[:team1]
            team2 = match[:team2]
            status = match[:status]

            team_data[team1][:mp] += 1
            team_data[team2][:mp] += 1

            case status
            when "win"
                team_data[team1][:w] += 1
                team_data[team1][:p] += GRANTED_POINTS["win"]
                team_data[team2][:l] += 1
                team_data[team2][:p] += GRANTED_POINTS["loss"]
            when "draw"
                team_data[team1][:d] += 1
                team_data[team1][:p] += GRANTED_POINTS["draw"]
                team_data[team2][:d] += 1
                team_data[team2][:p] += GRANTED_POINTS["draw"]
            when "loss"
                team_data[team1][:l] += 1
                team_data[team1][:p] += GRANTED_POINTS["loss"]
                team_data[team2][:w] += 1
                team_data[team2][:p] += GRANTED_POINTS["win"]
            end
        end
        team_data
    end
    
    def self.format_data(team_data)
        header = "Team                           | MP |  W |  D |  L |  P"
        lines = [header]

        sorted_teams = team_data.sort_by do |team_name, stats|
            [-stats[:p], team_name]
        end

        sorted_teams.each do |team_name, stats|
            line = sprintf("%-30s | %2d | %2d | %2d | %2d | %2d",
                    team_name, stats[:mp], stats[:w], stats[:d], stats[:l], stats[:p])
            lines << line
        end
        lines.join("\n") + "\n"
    end
end