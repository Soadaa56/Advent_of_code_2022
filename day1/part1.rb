class Day_one

  def initialize filename
    return unless File.exist?(filename)
    @file = File.open(filename)
    @elves = {}
  end

  def get_file
    return @file
  end

  def sum_up_elves
    elf_count = 0
    current_calories = 0
    current_most_calories = 0

    @file.each_line do |line|
      if line == "\n"
        elf_count += 1
        @elves[elf_count] = current_calories
        current_most_calories = current_calories unless current_most_calories > current_calories
        current_calories = 0
      else
        current_calories += line.to_i
      end
    end
  end

  def most_calories
    sum_up_elves
    
    puts "Elf number #{largest_hash_value(@elves)[0]} brought back the most calories totaling: \n#{largest_hash_value(@elves)[1]}"
  end

  def top_three_elves
    sum_up_elves

    puts "The total for top 3 elves are: \n#{sort_hash_top_three(@elves)}"
  end

  def largest_hash_value(hash)
    hash.max_by{|key,value| value}
  end

  def sort_hash_top_three(hash)
    total = 0
    hash = hash.sort_by {|k,v| v}.reverse

    total += hash[0][1]
    total += hash[1][1]
    total += hash[2][1]
    
    return total
  end

  def define
    puts @file.class
  end

end


# d = Day_one.new("input.md")
d = Day_one.new("input.md")
# d.most_calories
d.top_three_elves



# Seperate by newlines

# Add together for total, add to best

# Continue adding for total, replace best if bigger than best
