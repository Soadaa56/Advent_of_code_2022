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
    lettersTemp = []
    tempGroup = []

    @file.each_line.with_index(1) do |line, index|
      tempGroup << line.chomp.split('')
      puts "Index #{index}"
      print tempGroup
      puts "\n"
    end

    tempGroup
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

a = Solver.new("sample.md")
a.triplets