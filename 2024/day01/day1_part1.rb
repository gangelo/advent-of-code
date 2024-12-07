def read(file_path)
  ids = [[], []]

  File.read(file_path).split("\n").each do |row|
    left, right = row.split(' ')
    ids.first << left.to_i
    ids.last << right.to_i
  end

  [ids.first.sort, ids.last.sort]
end

def execute(ids)
  ids.transpose.map do |ids|
    ids.max - ids.min
  end.sum
end

file = "input.txt"
ids = read(File.join(__dir__, file))

puts execute(ids)
