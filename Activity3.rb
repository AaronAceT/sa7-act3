require 'csv'

def parse_csv(file_name)
  csv_data = []
  headers = []
  CSV.foreach(file_name, headers: true) do |row|
    headers = row.headers
    csv_data << row.to_h
  end
  csv_data
end

# Example Usage
data = parse_csv("data.csv")
puts data

ROOM_POINTS = [5, 10, 15]

def play_game
  total_points = 0
  puts "Welcome to the Adventure Game!"
  puts "You have 0 points."

  loop do
    puts "Choose a room (1-3) to enter or 'exit' to end the game: "
    input = gets.chomp.downcase

    if input == 'exit'
      puts "Game over! You collected a total of #{total_points} points."
      break
    elsif input.to_i.between?(1, 3)
      room_index = input.to_i - 1
      room_points = ROOM_POINTS[room_index]
      total_points += room_points
      puts "You entered Room #{input} and earned #{room_points} points."
    else
      puts "Invalid input. Please enter a number between 1 and 3 or 'exit'."
    end
  end
end

# Example Usage
play_game