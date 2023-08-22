class Solver

  def initialize filename
    return unless File.exist?(filename)
    @file = File.open(filename)
    @sum_strat = 0
  end

  def define_class
    puts @file.class
  end

  def sum_games
    total = 0

    @file.each_line do |line|
      # X = Rock, 1
      # Y = Paper, 2
      # Z = Scissor, 3
      case line[0]
      when "A" # Rock
        case line[2]
        when "X"
          total += 4 # Draw, 3 + 1
        when "Y"
          total += 8 # Win, 6 + 2
        else "Z"
          total += 3 # Lose, 0 + 3
        end
      when "B" # Paper
        case line[2]
        when "X"
          total += 1 # Lose, 0 + 1
        when "Y"
          total += 5 # Draw, 3 + 2
        else "Z"
          total += 9 # Win, 6 + 3
        end
      when "C" # Scissor
        case line[2]
        when "X"
          total += 7 # Win, 6 + 1
        when "Y"
          total += 2 # Lose, 0 + 2
        else "Z"
          total += 6 # Draw, 3 + 3
        end
      else
        puts "error"
      end
    end

    puts total
  end

  def strat
    @file.each_line do |line|
      case line[2]
      when "X"
        @sum_strat += lose_round(line[0])
      when "Y"
        @sum_strat += draw_round(line[0])
      when "Z"
        @sum_strat += win_round(line[0])
      else
        puts "error"
      end
    end

    puts @sum_strat
  end

  # A = Rock
  # B = Paper
  # C = Scissor

  def lose_round(opponent_choice)
    rock = 1
    paper = 2
    scissor = 3

    case opponent_choice
    when "A" # Rock
      return scissor
    when "B" # Paper
      return rock
    when "C" # Scissor
      return paper
    else
      puts "error"
    end
  end

  def draw_round(opponent_choice)
    rock = 4
    paper = 5
    scissor = 6

    case opponent_choice
    when "A" # Rock
      return rock
    when "B" # Paper
      return paper
    when "C" # Scissor
      return scissor
    else
      puts "error"
    end
  end

  def win_round(opponent_choice)
    rock = 7
    paper = 8
    scissor = 9

    case opponent_choice
    when "A" # Rock
      return paper
    when "B" # Paper
      return scissor
    when "C" # Scissor
      return rock
    else
      puts "error"
    end
  end

end

a = Solver.new("input.md")
a.strat