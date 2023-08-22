require 'byebug'

class Solver
  def initialize filename
    return unless File.exist?(filename)
    @file = File.open(filename)
    @total = 0
    @letters = []
  end

  def halves
    lettersTemp = []

    @file.each_line do |line|
      first_half = line[0, (line.size/2)]
      second_half = line[(line.size/2)..-1]

      first_half.split('').each do |char|
        for x in 0..second_half.size
          if char == second_half[x]
            lettersTemp << char
            next
          end
        end
      end
      @letters << lettersTemp[0]
      lettersTemp = []
    end

    for x in 0..@letters.size
      capital?(@letters[x])
    end

    puts @total
  end

  def triplets
    @firstRucksack = []
    @secondRucksack = []
    @thirdRucksack = []

    @file.each_line do |line|
      if @firstRucksack.empty?
        line.chomp.each_char { |char| @firstRucksack << char }
      elsif @secondRucksack.empty?
        line.chomp.each_char { |char| @secondRucksack << char }
      elsif @thirdRucksack.empty?
        line.chomp.each_char { |char| @thirdRucksack << char }
        compare_items(@firstRucksack, @secondRucksack, @thirdRucksack)
        clear_rucksacks
      else
        puts "Triplet each_line error"
      end
    end
    
    for x in 0..@letters.size
      capital?(@letters[x])
    end

    puts @total
   end

  def compare_items(array1, array2, array3)
    tempLetter = []

    array1.each do |char|
      break unless tempLetter.empty?
      for x in 0..array2.size
        if char == array2[x]
          for y in 0..array3.size
            if char == array3[y]
              tempLetter << char
              break
            end
          end
        end
      end
    end

    @letters << tempLetter[0]

  end

  def clear_rucksacks()
    @firstRucksack = []
    @secondRucksack = []
    @thirdRucksack = []
    return
  end


  def capital?(char)
    if char == nil
      return nil
    elsif char == char.downcase
      priority_lower_case(char)
    elsif char == char.upcase
      priority_upper_case(char)
    else
      puts "error"
    end
  end

  def priority_lower_case(char)
    lower_hash = ('a'..'z').each.with_index(1).to_h
    @total += lower_hash[char]
  end

  def priority_upper_case(char)
    upper_hash = ('A'..'Z').each.with_index(27).to_h
    @total += upper_hash[char]
  end

end

a = Solver.new("input.md")
a.triplets