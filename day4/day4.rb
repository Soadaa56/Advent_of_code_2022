require 'byebug'

class Solver
  def initialize filename
    return unless File.exist?(filename)
    @file = File.open(filename)
    @redundant_assignment_pairs = 0
  end
  
  def clean_ranges
    first_elf_pair = []
    second_elf_pair = []

    @file.each_line do |line|
      # split the line of the elf range of duties into 2 halves, no comma
      first_elf_pair = line.split(',')[0]
      second_elf_pair = line.split(',')[1].chomp

      # Populate an array based on the start and end of the elf duties range
      first_elf_start = first_elf_pair.split('-')[0].to_i
      first_elf_end = first_elf_pair.split('-')[1].to_i
      first_elf_ranges = Array (first_elf_start..first_elf_end)

      second_elf_start = second_elf_pair.split('-')[0].to_i
      second_elf_end = second_elf_pair.split('-')[1].to_i
      second_elf_ranges = Array (second_elf_start..second_elf_end)

      # Find the smaller Array, test if array contains other array
      if first_elf_ranges.size <= second_elf_ranges.size
        if (first_elf_ranges - second_elf_ranges).empty?
          @redundant_assignment_pairs += 1
        end
      elsif first_elf_ranges.size > second_elf_ranges.size
        if (second_elf_ranges - first_elf_ranges).empty?
          @redundant_assignment_pairs += 1
        end
      end
    end

    puts @redundant_assignment_pairs
  end

end

a = Solver.new("input.md")
a.clean_ranges