class Grid
  class << self
    # @param input [Array<Array<Integer>>] 木の高さの二次元配列
    #                                     ex) [[1, 2, 3], [3, 1, 2], [2, 3, 1]]
    # @return [Array<Hash>] 座標の配列 
    #                       ex) [{ "row" => 1, "column" => 2 }, { "row" => 2, "column" => 2 }, { "row" => 3, "column" => 2 }]
    def saddle_points(input)
      trees = build_trees_from_grid(input)

      east_west_max = find_trees(trees: trees, target: :max)
      north_south_min = find_trees(trees: trees, target: :min)

      candidate_trees = east_west_max & north_south_min
      candidate_trees.map do |tree|
        { "row" => tree.row, "column" => tree.column }
      end

    end

    private

    # @param input [Array<Array<Integer>>] 木の高さの二次元配列
    #                                    ex) [[1, 2, 3], [3, 1, 2], [2, 3, 1]]
    # @return [Array<Tree>] 木の高さと位置を持つTreeオブジェクトの配列
    #                                    ex) [Tree.new(height: 1, row: 1, column: 1), Tree.new(height: 2, row: 1, column: 2), ...]
    def build_trees_from_grid(input)
      input.flat_map.with_index do |tree_heights, row_index|
        build_trees_from_columns(tree_heights: tree_heights, row_index: row_index)
      end
    end

    # @param tree_heights [Array<Integer>] 木の高さの配列 ex) [1, 2, 3]
    # @param row_index [Integer] 木の行番号
    # @return [Array<Tree>] 木の高さと位置を持つTreeオブジェクトの配列
    def build_trees_from_columns(tree_heights:, row_index:)
      tree_heights.map.with_index do |height, column_index|
        Tree.new(height: height, row: row_index + 1, column: column_index + 1)
      end
    end
        
    # @param trees [Array<Tree>]
    # @param target [Symbol] :max or :min
    # @return [Array<Tree>]
    def find_trees(trees:, target:)
      case target
      # max な tree たちを取出す
      when :max
        trees.group_by(&:row).flat_map do |row, trees|
          max_height = trees.map(&:height).max
          trees.select { |tree| tree.height == max_height }
        end
      
      # min な tree たちを取出す
      when :min
        trees.group_by(&:column).flat_map do |column, trees|
          min_height = trees.map(&:height).min
          trees.select { |tree| tree.height == min_height }
        end

      else
        [] # 空を返す
      end
    end
  end

  # 木の高さと位置
  class Tree
    attr_reader :height, :row, :column

    # @param height [Integer] 木の高さ
    # @param row [Integer] 木の行番号
    # @param column [Integer] 木の列番号
    def initialize(height:, row:, column:)
      @height = height
      @row = row
      @column = column
    end
  end
end