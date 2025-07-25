require 'minitest/autorun'
require_relative 'tournament_ver2'

class TournamentTest < Minitest::Test
  def test_just_the_header_if_no_input
    # 
    input = <<~INPUT

    INPUT

    expected = <<~TALLY
      Team                           | MP |  W |  D |  L |  P
    TALLY

    assert_equal expected, Tournament.tally(input)
  end

  def test_a_win_is_three_points_a_loss_is_zero_points
    
    input = <<~INPUT
      Allegoric Alaskans;Blithering Badgers;win
    INPUT

    expected = <<~TALLY
      Team                           | MP |  W |  D |  L |  P
      Allegoric Alaskans             |  1 |  1 |  0 |  0 |  3
      Blithering Badgers             |  1 |  0 |  0 |  1 |  0
    TALLY

    assert_equal expected, Tournament.tally(input)
  end

  def test_a_win_can_also_be_expressed_as_a_loss
    
    input = <<~INPUT
      Blithering Badgers;Allegoric Alaskans;loss
    INPUT

    expected = <<~TALLY
      Team                           | MP |  W |  D |  L |  P
      Allegoric Alaskans             |  1 |  1 |  0 |  0 |  3
      Blithering Badgers             |  1 |  0 |  0 |  1 |  0
    TALLY

    assert_equal expected, Tournament.tally(input)
  end

  def test_a_different_team_can_win
    
    input = <<~INPUT
      Blithering Badgers;Allegoric Alaskans;win
    INPUT

    expected = <<~TALLY
      Team                           | MP |  W |  D |  L |  P
      Blithering Badgers             |  1 |  1 |  0 |  0 |  3
      Allegoric Alaskans             |  1 |  0 |  0 |  1 |  0
    TALLY

    assert_equal expected, Tournament.tally(input)
  end

  def test_a_draw_is_one_point_each
    
    input = <<~INPUT
      Allegoric Alaskans;Blithering Badgers;draw
    INPUT

    expected = <<~TALLY
      Team                           | MP |  W |  D |  L |  P
      Allegoric Alaskans             |  1 |  0 |  1 |  0 |  1
      Blithering Badgers             |  1 |  0 |  1 |  0 |  1
    TALLY

    assert_equal expected, Tournament.tally(input)
  end

  def test_there_can_be_more_than_one_match
    
    input = <<~INPUT
      Allegoric Alaskans;Blithering Badgers;win
      Allegoric Alaskans;Blithering Badgers;win
    INPUT

    expected = <<~TALLY
      Team                           | MP |  W |  D |  L |  P
      Allegoric Alaskans             |  2 |  2 |  0 |  0 |  6
      Blithering Badgers             |  2 |  0 |  0 |  2 |  0
    TALLY

    assert_equal expected, Tournament.tally(input)
  end

  def test_there_can_be_more_than_one_winner
    
    input = <<~INPUT
      Allegoric Alaskans;Blithering Badgers;loss
      Allegoric Alaskans;Blithering Badgers;win
    INPUT

    expected = <<~TALLY
      Team                           | MP |  W |  D |  L |  P
      Allegoric Alaskans             |  2 |  1 |  0 |  1 |  3
      Blithering Badgers             |  2 |  1 |  0 |  1 |  3
    TALLY

    assert_equal expected, Tournament.tally(input)
  end

  def test_there_can_be_more_than_two_teams
    
    input = <<~INPUT
      Allegoric Alaskans;Blithering Badgers;win
      Blithering Badgers;Courageous Californians;win
      Courageous Californians;Allegoric Alaskans;loss
    INPUT

    expected = <<~TALLY
      Team                           | MP |  W |  D |  L |  P
      Allegoric Alaskans             |  2 |  2 |  0 |  0 |  6
      Blithering Badgers             |  2 |  1 |  0 |  1 |  3
      Courageous Californians        |  2 |  0 |  0 |  2 |  0
    TALLY

    assert_equal expected, Tournament.tally(input)
  end

  def test_typical_input
    
    input = <<~INPUT
      Allegoric Alaskans;Blithering Badgers;win
      Devastating Donkeys;Courageous Californians;draw
      Devastating Donkeys;Allegoric Alaskans;win
      Courageous Californians;Blithering Badgers;loss
      Blithering Badgers;Devastating Donkeys;loss
      Allegoric Alaskans;Courageous Californians;win
    INPUT

    expected = <<~TALLY
      Team                           | MP |  W |  D |  L |  P
      Devastating Donkeys            |  3 |  2 |  1 |  0 |  7
      Allegoric Alaskans             |  3 |  2 |  0 |  1 |  6
      Blithering Badgers             |  3 |  1 |  0 |  2 |  3
      Courageous Californians        |  3 |  0 |  1 |  2 |  1
    TALLY

    assert_equal expected, Tournament.tally(input)
  end

  def test_incomplete_competition_not_all_pairs_have_played
    
    input = <<~INPUT
      Allegoric Alaskans;Blithering Badgers;loss
      Devastating Donkeys;Allegoric Alaskans;loss
      Courageous Californians;Blithering Badgers;draw
      Allegoric Alaskans;Courageous Californians;win
    INPUT

    expected = <<~TALLY
      Team                           | MP |  W |  D |  L |  P
      Allegoric Alaskans             |  3 |  2 |  0 |  1 |  6
      Blithering Badgers             |  2 |  1 |  1 |  0 |  4
      Courageous Californians        |  2 |  0 |  1 |  1 |  1
      Devastating Donkeys            |  1 |  0 |  0 |  1 |  0
    TALLY

    assert_equal expected, Tournament.tally(input)
  end

  def test_ties_broken_alphabetically
    
    input = <<~INPUT
      Courageous Californians;Devastating Donkeys;win
      Allegoric Alaskans;Blithering Badgers;win
      Devastating Donkeys;Allegoric Alaskans;loss
      Courageous Californians;Blithering Badgers;win
      Blithering Badgers;Devastating Donkeys;draw
      Allegoric Alaskans;Courageous Californians;draw
    INPUT

    expected = <<~TALLY
      Team                           | MP |  W |  D |  L |  P
      Allegoric Alaskans             |  3 |  2 |  1 |  0 |  7
      Courageous Californians        |  3 |  2 |  1 |  0 |  7
      Blithering Badgers             |  3 |  0 |  1 |  2 |  1
      Devastating Donkeys            |  3 |  0 |  1 |  2 |  1
    TALLY

    assert_equal expected, Tournament.tally(input)
  end

  def test_ensure_points_sorted_numerically
    
    input = <<~INPUT
      Devastating Donkeys;Blithering Badgers;win
      Devastating Donkeys;Blithering Badgers;win
      Devastating Donkeys;Blithering Badgers;win
      Devastating Donkeys;Blithering Badgers;win
      Blithering Badgers;Devastating Donkeys;win
    INPUT

    expected = <<~TALLY
      Team                           | MP |  W |  D |  L |  P
      Devastating Donkeys            |  5 |  4 |  0 |  1 | 12
      Blithering Badgers             |  5 |  1 |  0 |  4 |  3
    TALLY

    assert_equal expected, Tournament.tally(input)
  end
end
