# プレイヤー
class Player
  # @param level [Integer] プレイヤーのレベル
  # @param earned_points [Array<Integer>] 獲得したポイントの配列
  def initialize(level: 0, earned_points: [])
    @level = level
    @earned_points = earned_points
  end

  # 魔法アイテムを取得するメソッド
  # @param magical_item [MagicalItem] 取得する魔法アイテム
  def get_item(magical_item)
    @earned_points += calc_earned_point(magical_item.point)
    @earned_points.uniq!
  end

  # 獲得したポイントの合計を返すメソッド
  # @return [Integer] 獲得したポイントの合計
  def total_earned_points
    @earned_points.sum
  end

  private

  # プレイヤーのレベルに応じて獲得ポイントを計算するメソッド
  # @param point [Integer] 魔法アイテムの基本ポイント
  # @return [Array<Integer>] プレイヤーのレベルに応じて計算された獲得ポイント
  def calc_earned_point(point)
    points = []

    (1...@level).each do |num|
      next if num % point != 0

      points << num
    end

    points
  end
end

# 魔法アイテム
class MagicalItem
  attr_reader :point

  # @param point [Integer] 魔法アイテムの基本ポイント
  def initialize(point)
    @point = point
  end
end

# 獲得ポイント計算クラス
class SumOfMultiples
  # @param magical_item_points [Array<Integer>] 魔法アイテムのポイント
  def initialize(magical_item_points)
    @magical_item_point = magical_item_points.map do |point|
      MagicalItem.new(point)
    end
  end

  # @param level [Integer] プレイヤーのレベル
  # @return [Integer] クリアした時に与えられるエネルギーポイント
  def to(level)
    player = Player.new(level)
    @magical_items.each do |magical_item|
      player.get_item(magical_item)
    end

    player.total_earned_points
  end
end
