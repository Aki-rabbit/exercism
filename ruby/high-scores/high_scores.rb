=begin
Write your code for the 'High Scores' exercise in this file. Make the tests in
`high_scores_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/high-scores` directory.
=end

#リストから最高のスコア、最後に追加されたスコア、上位３つのスコアを返す

class HighScores
    attr_reader :scores

    def initialize(scores)
        @scores = scores
    end

    def personal_best
        @scores.max #最高のスコアを返す
    end

    def latest
        @scores.last #最後に追加されたスコアを返す
    end

    def latest_is_personal_best?
        latest == personal_best #最新のスコアが最高のスコアと同じかどうかを確認
    end

    def personal_top_three
        @scores.sort.reverse.take(3) #スコアを降順にソートし、上位３つのスコアを返す
    end
end