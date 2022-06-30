require "http"
require "tty-table"

system "clear"

puts "Welcome to the book shop!"

puts "Would you like to see all books currently available: [Y]es or [N]o"

user_input = gets.chomp.upcase

until user_input == "N"
  if user_input == "Y"
    table = TTY::Table.new(["Title and author", "Price"], [])

    response = HTTP.get("http://localhost:3000/products")

    data = JSON.parse(response.body)
    index = 0

    while index < data.length
      name = data[index]["name"]
      price = data[index]["price"]

      table << [title, author, price]
      index = index + 1
    end

    puts table.render(:ascii)

    puts "Press [ENTER] when finished."
    user_input_enter = gets.chomp
    puts "Would you like to see all books currently available: [Y]es or [N]o"
    user_input = gets.chomp.upcase
  else
    puts "Please try again.."
    puts "Would you like to see all books currently available: [Y]es or [N]o"
    user_input = gets.chomp.upcase
  end
end
