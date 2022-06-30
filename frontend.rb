require "http"
require "tty-table"

system "clear"

table = TTY::Table.new(["Title", "Author", "Price"], [])

response = HTTP.get("http://localhost:3000/products")

data = JSON.parse(response.body)
index = 0

while index < data.length
  title = data[index]["title"]
  author = data[index]["author"]
  price = data[index]["price"]

  table << [title, author, price]
  index = index + 1
end

puts table.render(:ascii)
