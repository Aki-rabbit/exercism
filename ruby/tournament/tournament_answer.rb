class Tournament
  class << self
    # @param input [String] 
    # @note ex) Allegoric Alaskans;Blithering Badgers;win
    #           Devastating Donkeys;Courageous Californians;draw
    #           Devastating Donkeys;Allegoric Alaskans;win
    #           Courageous Californians;Blithering Badgers;loss
    #           Blithering Badgers;Devastating Donkeys;loss
    #           Allegoric Alaskans;Courageous Californians;win
    # @return [String]
    # @note ex) Team                           | MP |  W |  D |  L |  P
    #           Devastating Donkeys            |  3 |  2 |  1 |  0 |  7
    #           Allegoric Alaskans             |  3 |  2 |  0 |  1 |  6
    #           Blithering Badgers             |  3 |  1 |  0 |  2 |  3
    #           Courageous Californians        |  3 |  0 |  1 |  2 |  1
    def tally(input)
      games = parse_input(input)
      gamed_teams = Game.play_multiple(games)
      results = calc_results(gamed_teams)
      format_results(results)

      # 順位表を作成する
      header = "Team                           | MP |  W |  D |  L |  P"
      output_lines = [header]
      sorted_teams = teams.values.sort_by { |team| [-team.points, team.name] }
      sorted_teams.each do |team|
        output_line = sprintf("%-30s | %2d | %2d | %2d | %2d | %2d",
          team.name, team.mp, team.won_count, team.draw_count, team.loss_count, team.points)
        output_lines << output_line
      end
      output_lines.join("\n") + "\n"
    end

    private

      def calc_results
        @teams.each do |team|
          {
            name: team.name,
            points: team.won_count * 3 + team.draw_count * 1,
            mp: team.match_count,
          }
        end
      end

    # @param [String]
    # @return [Array<Hash>]
    def parse_input(input)
      input_lines = input.lines.map(&:strip).reject(&:empty?)
      teams = Hash.new { |h, name| h[name] = Team.new(name: name) }

      input_lines.map do |line|
        team1_name, team2_name, result = line.split(";")
        team1 = teams[team1_name]
        team2 = teams[team2_name]
        { team1: team1, team2: team2, result: result }
      end
    end
  end

  class Game
    class << self
      def play_multiple(games)
        games.each { |game| play(team1: game[:team1], team2: game[:team2], result: game[:result]) }
      end

      def play(team1:, team2:, result:)
        case result
        when "win"
          team1.win
          team2.loss
        when "draw"
          team1.draw
          team2.draw
        when "loss"
          team1.loss
          team2.win
        end
        # TODO: 試合結果が記録される
      end

    end
  end

  # チーム
  class Team
    attr_reader :name, :mp, :won_count, :draw_count, :loss_count, :points
    # @param name [String] チーム名
    # @param mp [Integer] 試合数
    # @param won [Integer] 勝利数
    # @param draw [Integer] 引き分け数
    # @param loss [Integer] 敗北数
    # @param points [Integer] ポイント
    def initialize(name:, mp: 0, won: 0, draw: 0, loss: 0, points: 0)
      @name = name
      @won_count = won
      @draw_count = draw
      @loss_count = loss
      @mp = mp
    end

    def win
      @mp += 1
      @won_count += 1
      @points += 3
    end

    def loss
      @mp += 1
      @loss_count += 1
    end

    def draw
      @mp += 1
      @draw_count += 1
      @points += 1
    end
  end
end
