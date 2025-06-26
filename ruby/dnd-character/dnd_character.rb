=begin
Write your code for the 'D&D Character' exercise in this file. Make the tests in
`dnd_character_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/dnd-character` directory.
=end

#6面ダイスを4つ振り、最も大きい３つのダイスの合計を記録する
#筋力、器用さ、耐久力、知力、判断力、魅力それぞれに対して以上の合計値を割り当てる
#キャラクターの初期ヒットポイントは、10 + キャラクターの耐久力修正値です。
#キャラクターの耐久力修正値は、キャラクターの耐久力から10を引いて2で割り、小数点以下を切り捨てることで求められます。


class DndCharacter
  attr_reader :strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma, :hitpoints

  def self.modifier(constitution)
    modified_constitution = (constitution - 10)/2
  end

  def initialize
    %i[strength dexterity constitution intelligence wisdom charisma].each do |ability|
      instance_variable_set(:"@#{ability}", self.class.ability_score)
    end
    @hitpoints = 10 + self.class.modifier(@constitution) #初期ヒットポイントは10 + 耐久力修正値
  end

  def self.ability_score
    rolls = Array.new(4) { rand(1..6) }
    roll_sum = rolls.sort.last(3).sum #4つのダイスを振り、最も大きい3つのダイスの合計を計算
  end

  
end
