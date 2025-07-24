
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
      # TODO:
    end
  end

  class Game
    class << self
      def play(team1:, team2:, result:)
        # TODO: 試合結果が記録される
      end
    end
  end

  # チーム
  class Team
    # @param name [String] チーム名
    # @param mp [Integer] 試合数
    # @param won [Integer] 勝利数
    # @param draw [Integer] 引き分け数
    # @param loss [Integer] 敗北数
    # @param points [Integer] ポイント
    def initialize(name:, mp: 0, won: 0, draw: 0, loss: 0, points: 0)
      @name = name
      @mp = mp
      @won = won
      @draw = draw
      @loss = loss
      @points = points
    end

    def win
      @mp += 1
    end

    def loss
      # TODO: 敗北の処理
    end

    def draw
      # TODO: 引き分けの処理
    end
  end
end
