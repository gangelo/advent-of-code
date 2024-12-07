def read(file_path)
  left = []
  right = []

  File.read(file_path).split("\n").each do |row|
    l, r = row.split(' ')
    left << l.to_i
    right << r.to_i
  end

  [left.sort, right.sort]
end

def execute(left, right)
  right_counts = right.each_with_object(Hash.new(0)) { |num, counts| counts[num] += 1 }

  left.each_with_index do |l, index|
    left[index] = l * right_counts[l]
  end

  left.sum
end

file = "input.txt"
left, right = read(File.join(__dir__, file))

puts execute(left, right)
