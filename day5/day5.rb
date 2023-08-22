require 'byebug'

class Solver

  def initialize filename
    return unless File.exist?(filename)
    @file = File.open(filename)
    @parsedStacks = []
  end

  def parser
    tempCrates = []
    counter = 0

    @file.each_line do |line|
      if line == "\n"
        break
      end
      # line.chomp.each_char do |char|
      #   unless char == " "
      #     tempCrates << char
      #   end
      # end
      for x in 0..line.size
        if counter == 3
          tempCrates << [line.chomp]
        end
        counter += 1
      end
    end

    
    print tempCrates
    puts ""

  end

end

a = Solver.new("sample.md")
a.parser